// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AgoraRtcKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "RtcBasic", targets: ["AgoraRtcKit", "AgoraCore", "Agorafdkaac", "Agoraffmpeg", "AgoraSoundTouch"]),
        .library(name: "AINS", targets: ["AgoraAiNoiseSuppressionExtension"]),
        .library(name: "AudioBeauty", targets: ["AgoraAudioBeautyExtension"]),
        .library(name: "ClearVision", targets: ["AgoraClearVisionExtension"]),
        .library(name: "ContentInspect", targets: ["AgoraContentInspectExtension"]),
        .library(name: "SpatialAudio", targets: ["AgoraSpatialAudioExtension"]),
        .library(name: "VirtualBackground", targets: ["AgoraVideoSegmentationExtension"]),
        .library(name: "AIAEC", targets: ["AgoraAiEchoCancellationExtension"]),
        .library(name: "DRM", targets: ["AgoraDrmLoaderExtension"]),
        .library(name: "VQA", targets: ["AgoraVideoQualityAnalyzerExtension"]),
        .library(name: "FaceDetection", targets: ["AgoraFaceDetectionExtension"]),
        .library(name: "VideoCodecEnc", targets: ["AgoraVideoEncoderExtension", "video_enc"]),
        .library(name: "VideoCodecDec", targets: ["AgoraVideoDecoderExtension", "video_dec"]),
        .library(name: "ReplayKit", targets: ["AgoraReplayKitExtension"]),
        .library(name: "ScreenCapture", targets: ["AgoraScreenCaptureExtension"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "AgoraDrmLoaderExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraDrmLoaderExtension.xcframework.zip",
            checksum: "810f016147545a836e3e9f91643b68543e5c6d8ed8ddeeb1845fdbb67368e1b3"
        ),
        .binaryTarget(
            name: "AgoraSoundTouch",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraSoundTouch.xcframework.zip",
            checksum: "432f3a9dbcacb7cac5237a40c69d043d55483851c1b4f5e5fdc6d4d41cacaa20"
        ),
        .binaryTarget(
            name: "AgoraAiNoiseSuppressionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraAiNoiseSuppressionExtension.xcframework.zip",
            checksum: "c4979ef78313485856e9a914db641c89c1e1075445ffb357ce89b9165fd5c046"
        ),
        .binaryTarget(
            name: "AgoraClearVisionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraClearVisionExtension.xcframework.zip",
            checksum: "b6b306ee53b90f27071f31301185e61f0ea209e94731358775f06f8fd5842c49"
        ),
        .binaryTarget(
            name: "AgoraAudioBeautyExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraAudioBeautyExtension.xcframework.zip",
            checksum: "79e81136695673d14a62cc7c269e4d5a08ceeefaa40b298c60182be02edbe56c"
        ),
        .binaryTarget(
            name: "AgoraVideoQualityAnalyzerExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraVideoQualityAnalyzerExtension.xcframework.zip",
            checksum: "e4f482e5b27661b66844817828201cac988114338460cc9bce13be3f5591edba"
        ),
        .binaryTarget(
            name: "Agoraffmpeg",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/Agoraffmpeg.xcframework.zip",
            checksum: "875d0a3c8a83965be161d0e53e46b7aef8342f34358c4f18d9a699a99e62456b"
        ),
        .binaryTarget(
            name: "AgoraCore",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraCore.xcframework.zip",
            checksum: "f43c96e45feea46eed074a9d5f00df41e251e9130ede99d549e6fef4e202fbac"
        ),
        .binaryTarget(
            name: "AgoraAiEchoCancellationExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraAiEchoCancellationExtension.xcframework.zip",
            checksum: "afaaad450f46007ab90fd88823179692b99c0737f0283d695b5e214f25d90949"
        ),
        .binaryTarget(
            name: "AgoraVideoSegmentationExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraVideoSegmentationExtension.xcframework.zip",
            checksum: "82874764c0b2069ce69cf61a63f09daee83e17384cc956341573795a6676ff93"
        ),
        .binaryTarget(
            name: "AgoraFaceDetectionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraFaceDetectionExtension.xcframework.zip",
            checksum: "1f2ac3b6bfb55f4246bdab581c49554df53c30bebf3059b4221985975bdc571b"
        ),
        .binaryTarget(
            name: "AgoraRtcKit",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraRtcKit.xcframework.zip",
            checksum: "2103d089d3f3bf16777bb660a2be3c499f5be0228d35929dad92178ca2b0aea1"
        ),
        .binaryTarget(
            name: "video_dec",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/video_dec.xcframework.zip",
            checksum: "fb1dec3c9e58db6644c551317826f26bb9659dc92733acedf93b4c194195559b"
        ),
        .binaryTarget(
            name: "AgoraReplayKitExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraReplayKitExtension.xcframework.zip",
            checksum: "4abf8bff0acea6558bfb7d25df1a26e8e99b64ac780db1abce45a6c8e7d22583"
        ),
        .binaryTarget(
            name: "video_enc",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/video_enc.xcframework.zip",
            checksum: "fe2e21812548a8ed3b0fbfbe2be1559cda9d36662fdd3a68b3d1c32d783e76b6"
        ),
        .binaryTarget(
            name: "AgoraVideoEncoderExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraVideoEncoderExtension.xcframework.zip",
            checksum: "e186dd21c8b35d73176903e66369b5f2c8b88a1d13787c393e43e22dfdddb654"
        ),
        .binaryTarget(
            name: "AgoraSpatialAudioExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraSpatialAudioExtension.xcframework.zip",
            checksum: "5e36a93e4e00ff7ce40b5069537aadc6ee07e1ca1febebf98f6cda41bf4e06d9"
        ),
        .binaryTarget(
            name: "AgoraVideoDecoderExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraVideoDecoderExtension.xcframework.zip",
            checksum: "718bd541f7338652ae48fd899c67db85488d07075e7e8dc2a556c4a45eac6e6a"
        ),
        .binaryTarget(
            name: "Agorafdkaac",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/Agorafdkaac.xcframework.zip",
            checksum: "dbd02311566ee95da7840e74779cc34f2e00be60e75f83c6fd59b2d24ae42602"
        ),
        .binaryTarget(
            name: "AgoraContentInspectExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraContentInspectExtension.xcframework.zip",
            checksum: "5d0bdb90c7ab657a45521491d0a6ad6132a731bd35ab99b52b277405ffcb0c6c"
        ),
        .binaryTarget(
            name: "AgoraScreenCaptureExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.1/AgoraScreenCaptureExtension.xcframework.zip",
            checksum: "9640eb6edc9360696afb0deddeb63c02e82005357120f618dde7a4445498e28d"
        ),
    ]
)