import os
import requests
import re
import zipfile
import shutil
import plistlib
import hashlib
import sys
import subprocess

def parse_package_swift(file_path_or_url):
    products = []
    targets = {}
    dependencies = []
    
    lines = None

    if file_path_or_url.startswith("http"):
        # It's a URL, download it
        response = requests.get(file_path_or_url)
        if response.status_code != 200:
            print(f"Failed to download {file_path_or_url}. HTTP status code: {response.status_code}")
            exit
        lines = response.text.split("\n")
    else:
        # It's a file path, read it
        with open(file_path_or_url, 'r') as file:
            lines = file.readlines()

    if lines is None:
        return None

    is_product_block = False
    is_target_block = 0
    is_dependency_block = False

    name = None
    for line in lines:
        line = line.strip()

        if not name:
            name_search = re.search('name: "(.*)"', line)
            if name_search:
                name = name_search.group(1)

        if 'products: [' in line:
            is_product_block = True
            continue
        
        if not is_product_block and 'targets: [' in line:
            is_target_block = line.count('[') - line.count(']')
            continue

        if not is_product_block and 'dependencies: [' in line:
            is_dependency_block = True
            continue

        if is_product_block:
            product_match = re.search('\.library\(name: "(.*)", targets: \[(.*)\]\)', line)
            if product_match:
                product_name = product_match.group(1)
                product_targets = [t.strip().replace('"', '') for t in product_match.group(2).split(",")]
                products.append({"type": "library", "name": product_name, "targets": product_targets})

        if is_target_block:
            is_target_block += line.count('[') - line.count(']')
            if is_target_block <= 0:
                is_target_block = False
                current_target = None
                continue

            name_match = re.search(r'name: "(.*?)"', line)
            url_match = re.search(r'url: "(.*?)"', line)

            if name_match:
                current_target = {"type": "binaryTarget", "name": name_match.group(1)}
                targets[name_match.group(1)] = current_target
                
            if url_match and current_target:
                current_target["url"] = url_match.group(1)
                
        if is_dependency_block:
            # Add logic to extract dependencies if needed
            pass

        if '],' in line:
            is_product_block = False
            is_target_block = False
            is_dependency_block = False

    return {
        "name": name,
        "products": products,
        "targets": targets,
        "dependencies": dependencies
    }

def compare_dicts(dict1, dict2, key):
    set1 = {entry[key] for entry in dict1}
    set2 = {entry[key] for entry in dict2}
    common = set1 & set2
    only_in_dict1 = set1 - common
    only_in_dict2 = set2 - common
    return common, only_in_dict1, only_in_dict2

def compare_target_keys(dict1, dict2):
    # Get the keys as sets
    keys1 = set(dict1.keys())
    keys2 = set(dict2.keys())

    # Find keys that are only in the first dictionary
    only_in_first = keys1 - keys2

    # Find keys that are only in the second dictionary
    only_in_second = keys2 - keys1

    # Find keys that are in both dictionaries
    in_both = keys1 & keys2

    # Find all unique keys
    all_keys = keys1 | keys2

    # Return the result as a dictionary
    return {
        "only_in_first": list(only_in_first),
        "only_in_second": list(only_in_second),
        "in_both": list(in_both),
        "all_keys": list(all_keys)
    }

def calculate_sha256(file_path):
    sha256_hash = hashlib.sha256()
    with open(file_path, "rb") as f:
        # Read the file in chunks of 4K
        for byte_block in iter(lambda: f.read(4096), b""):
            sha256_hash.update(byte_block)
    return sha256_hash.hexdigest()

def download_xcframework_zip(url: str, destination_folder: str):
    # Create the destination folder if it doesn't exist
    os.makedirs(destination_folder, exist_ok=True)

    response = requests.get(url)
    if response.status_code == 200:
        zip_path = os.path.join(destination_folder, url.split('/')[-1])
        with open(zip_path, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded {zip_path}")

        # Unzip the content
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(destination_folder)
        print(f"Unzipped to {zip_path[:-4]}")
        os.remove(zip_path)
    else:
        print(f"Failed to download {url}. Status code: {response.status_code}")
        exit

def merge_xcframeworks(src1: str, src2: str, dest: str):
    # Create destination directory if it doesn't exist
    os.makedirs(dest, exist_ok=True)

    # Copy all files and folders from src1 to dest
    for item in os.listdir(src1):
        s = os.path.join(src1, item)
        d = os.path.join(dest, item)
        if os.path.isdir(s):
            shutil.copytree(s, d)
        else:
            shutil.copy2(s, d)
    
    # Merge nested directories from src2 to dest
    for item in os.listdir(src2):
        s = os.path.join(src2, item)
        d = os.path.join(dest, item)
        if os.path.isdir(s):
            if os.path.isdir(d):
                # If directory already exists in dest, we need to merge
                for sub_item in os.listdir(s):
                    sub_s = os.path.join(s, sub_item)
                    sub_d = os.path.join(d, sub_item)
                    if os.path.isdir(sub_s):
                        shutil.copytree(sub_s, sub_d)
                    else:
                        shutil.copy2(sub_s, sub_d)
            else:
                shutil.copytree(s, d)
        else:
            if not os.path.exists(d):
                shutil.copy2(s, d)
    
    # Merge Info.plist files
    info1_path = os.path.join(src1, "Info.plist")
    info2_path = os.path.join(src2, "Info.plist")
    dest_info_path = os.path.join(dest, "Info.plist")

    with open(info1_path, "rb") as f:
        info1 = plistlib.load(f)
    with open(info2_path, "rb") as f:
        info2 = plistlib.load(f)

    combined_libraries = info1.get("AvailableLibraries", []) + info2.get("AvailableLibraries", [])
    info1["AvailableLibraries"] = combined_libraries

    with open(dest_info_path, "wb") as f:
        plistlib.dump(info1, f)

def zip_and_delete(filepath):
    dir_name_only = os.path.basename(filepath)
    parent_dir = os.path.dirname(filepath)
    zip_name = f"{dir_name_only}.zip"
    
    subprocess.run(["zip", "-r", zip_name, dir_name_only], cwd=parent_dir)

    # Delete the original directory
    shutil.rmtree(filepath)

def merge_frameworks(ios_source, macos_source, destination):
    # Compare Targets
    result = compare_target_keys(ios_source['targets'], macos_source['targets'])
    print(f"Common Targets: {result['in_both']}")
    print(f"iOS only Targets: {result['only_in_first']}")
    print(f"macOS only Targets: {result['only_in_second']}")
    # Create the destination folder if it doesn't exist
    os.makedirs(f'{destination}_iOS', exist_ok=True)
    os.makedirs(f'{destination}_macOS', exist_ok=True)
    os.makedirs(destination, exist_ok=True)
    for target in result['in_both']:
        download_xcframework_zip(ios_source['targets'][target]['url'], f'{destination}_iOS')
        download_xcframework_zip(macos_source['targets'][target]['url'], f'{destination}_macOS')
        merge_xcframeworks(f'{destination}_macOS/{target}.xcframework', f'{destination}_iOS/{target}.xcframework', f'{destination}/{target}.xcframework')
        zip_and_delete(f'{destination}/{target}.xcframework')
    for target in result['only_in_first']:
        download_xcframework_zip(ios_source['targets'][target]['url'], destination)
        zip_and_delete(f'{destination}/{target}.xcframework')
    for target in result['only_in_second']:
        download_xcframework_zip(macos_source['targets'][target]['url'], destination)
        zip_and_delete(f'{destination}/{target}.xcframework')

def generate_package_swift(parsed_info, version: str):
    package_swift = [
        "// swift-tools-version:5.3",
        'import PackageDescription',
        '',
        f'let package = Package(',
        f'    name: "{parsed_info["name"]}",',
        f'    platforms: [',
        f'        .iOS(.v13),',
        f'        .macOS(.v10_15)',
        f'    ],',
        f'    products: [',
    ]
    
    # Add products to the package
    for product in parsed_info['products']:
        targets_str = str([str(target) for target in product["targets"]]).replace("'", '"')
        package_swift.append(f'        .library(name: "{product["name"]}", targets: {targets_str}),')
    
    package_swift.append('    ],')
    package_swift.append('    dependencies: [],')
    package_swift.append('    targets: [')
    
    # Add targets to the package
    for target_name, target_info in parsed_info['targets'].items():
        fileSha = calculate_sha256(f'libs/{target_name}.xcframework.zip')
        package_swift.append(
            f'        .binaryTarget(\n'
            f'            name: "{target_name}",\n'
            # f'            path: "libs/{target_name}.xcframework.zip"\n'
            f'            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/{version}/{target_name}.xcframework.zip",\n'
            f'            checksum: "{fileSha}"\n'
            f'        ),'
        )
    
    package_swift.append('    ]')
    package_swift.append(')')
    
    return '\n'.join(package_swift)

def merge_dicts(dict1, dict2):
    merged_dict = dict1.copy()  # Start with dict1's keys and values
    
    for key, value in dict2.items():
        # If key is not in merged_dict, add it
        if key not in merged_dict:
            merged_dict[key] = value
        else:
            # If key is "products" or "targets", merge them
            if key == "products":
                merged_products = merged_dict[key]
                for product2 in value:
                    if product2 not in merged_products:
                        merged_products.append(product2)
                merged_dict[key] = merged_products
            elif key == "targets":
                merged_targets = merged_dict[key]
                for target_key, target_value in value.items():
                    merged_targets[target_key] = target_value  # Overwrite or add
                merged_dict[key] = merged_targets
            # For any other key, keep the value from dict1 (or use other logic)
    
    return merged_dict

if __name__ == "__main__":
    version = sys.argv[1]
    
    ios_path = f"https://raw.githubusercontent.com/AgoraIO/AgoraRtcEngine_iOS/{version}/Package.swift"
    ios_parsed_info = parse_package_swift(ios_path)
    macos_path = f"https://raw.githubusercontent.com/AgoraIO/AgoraRtcEngine_macOS/{version}/Package.swift"
    macos_parsed_info = parse_package_swift(macos_path)

    common_products, ios_only_products, macos_only_products = compare_dicts(ios_parsed_info['products'], macos_parsed_info['products'], 'name')
    print(f"Common Products: {common_products}")
    print(f"iOS only Products: {ios_only_products}")
    print(f"macOS only Products: {macos_only_products}")
    
    merge_frameworks(ios_parsed_info, macos_parsed_info, 'libs')

    merged_dicts = merge_dicts(ios_parsed_info, macos_parsed_info)
    package_text = generate_package_swift(merged_dicts, version)
    with open('Package.swift', 'w') as file:
        file.write(package_text)
