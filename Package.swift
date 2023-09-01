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
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraDrmLoaderExtension.xcframework.zip",
            checksum: "fd4103ad52a9537fba7701a35059b9c3221838d09dbc151fa116504e3b709628"
        ),
        .binaryTarget(
            name: "AgoraSoundTouch",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraSoundTouch.xcframework.zip",
            checksum: "6c6b2fb63cd5b70522773a069ccab50fe04300f9d15d9947c3bed2f85a3cfe7a"
        ),
        .binaryTarget(
            name: "AgoraAiNoiseSuppressionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraAiNoiseSuppressionExtension.xcframework.zip",
            checksum: "4bcb49d0b0008fc8d6453ad9d478966df728707848bdbf90f30edabab3874b91"
        ),
        .binaryTarget(
            name: "AgoraClearVisionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraClearVisionExtension.xcframework.zip",
            checksum: "46180d9c9d0e2355892f50ceb31eada4e4313a3951193531c636072ec60825a1"
        ),
        .binaryTarget(
            name: "AgoraAudioBeautyExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraAudioBeautyExtension.xcframework.zip",
            checksum: "2e713cf08f393d02a3f0d261264cbdf50ba58d87ce6084a08f38f009ddd1b7b6"
        ),
        .binaryTarget(
            name: "AgoraVideoQualityAnalyzerExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraVideoQualityAnalyzerExtension.xcframework.zip",
            checksum: "e1759ff275e5ae8537288b4f8c6cbf8fdf3780f3d593d4176bef1d6778829ae3"
        ),
        .binaryTarget(
            name: "Agoraffmpeg",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/Agoraffmpeg.xcframework.zip",
            checksum: "6ecb1a197abde956526c6a93979d6c9fed109ba1bbd6823d97d1b395eeff9a36"
        ),
        .binaryTarget(
            name: "AgoraCore",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraCore.xcframework.zip",
            checksum: "b40c5aeeac35c948f91c042f6ec08c970040b68f2dd5f38a47c09bf54aeb1102"
        ),
        .binaryTarget(
            name: "AgoraAiEchoCancellationExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraAiEchoCancellationExtension.xcframework.zip",
            checksum: "84b89d4b9b4334e684f88ccfd11fb95fe3c39e7f07059360507650975940393c"
        ),
        .binaryTarget(
            name: "AgoraVideoSegmentationExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraVideoSegmentationExtension.xcframework.zip",
            checksum: "fa1865a2f65b83f74a82f2c81718ab9bfd87970a3d864d3475a761e6ad1758c9"
        ),
        .binaryTarget(
            name: "AgoraFaceDetectionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraFaceDetectionExtension.xcframework.zip",
            checksum: "73a9587296499fdc3db88d4ea633f7b13ed80496e5809f615eebe613da47cc06"
        ),
        .binaryTarget(
            name: "AgoraRtcKit",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraRtcKit.xcframework.zip",
            checksum: "dc10551f8bfb23639c295944481f5a49ae97865d6ccf3329cfe42afb2f877b10"
        ),
        .binaryTarget(
            name: "video_dec",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/video_dec.xcframework.zip",
            checksum: "80580ae9bee45e1e064ba8c86dbd5c2ec29d017466e62e04de6b9290bc72b068"
        ),
        .binaryTarget(
            name: "AgoraReplayKitExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraReplayKitExtension.xcframework.zip",
            checksum: "16204a07e6b660ce897cdf918e792947421ea309a889cb2071027930a5c1f0c0"
        ),
        .binaryTarget(
            name: "video_enc",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/video_enc.xcframework.zip",
            checksum: "d9602226694b3459aeb42b07c34a03ec5ea7959490955ed13a95255587af6393"
        ),
        .binaryTarget(
            name: "AgoraVideoEncoderExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraVideoEncoderExtension.xcframework.zip",
            checksum: "cb1fd40bab4e6a7a19db6ad552798903da5f3f2a50ecd87fccfc7726cb44e11f"
        ),
        .binaryTarget(
            name: "AgoraSpatialAudioExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraSpatialAudioExtension.xcframework.zip",
            checksum: "52fac1c0abd5f4bfc62615b4468351d126bba845161896c0c0f38384ec68a610"
        ),
        .binaryTarget(
            name: "AgoraVideoDecoderExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraVideoDecoderExtension.xcframework.zip",
            checksum: "af3cb327a0cd5f465d3cbcc470ce1bca6ee7baa1b899078b78834a32a06a6a23"
        ),
        .binaryTarget(
            name: "Agorafdkaac",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/Agorafdkaac.xcframework.zip",
            checksum: "aa3e27f6527ae137c50c850d1f5623a34f2231d00b20a6e95aa0e15748ebdadd"
        ),
        .binaryTarget(
            name: "AgoraContentInspectExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraContentInspectExtension.xcframework.zip",
            checksum: "d8d51de4dc0f10b046b9399af3d601bb4fcf52a03d2c6ce6a5697598b5ad3ba0"
        ),
        .binaryTarget(
            name: "AgoraScreenCaptureExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraScreenCaptureExtension.xcframework.zip",
            checksum: "c378b74585ebb99a8fb3b2c3a50a70994b8dff7d6ee9e4b3010f364e2db4b0d3"
        ),
    ]
)