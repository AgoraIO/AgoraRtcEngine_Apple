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
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraDrmLoaderExtension.xcframework.zip",
            checksum: "da07fc572c152a234601cf0b5f474e14ebe8511390913f50ecf883651fe05d7d"
        ),
        .binaryTarget(
            name: "AgoraSoundTouch",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraSoundTouch.xcframework.zip",
            checksum: "7776acfa4234afc41c841a3e524b3cd9f0bd31a07481a8b925a36fb4f4ee60a3"
        ),
        .binaryTarget(
            name: "AgoraAiNoiseSuppressionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraAiNoiseSuppressionExtension.xcframework.zip",
            checksum: "49f39f3ea07c00b9151b7161de0d79500e6f04163671bca9b682f455c65def28"
        ),
        .binaryTarget(
            name: "AgoraClearVisionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraClearVisionExtension.xcframework.zip",
            checksum: "83979e5bdcc5d40c4abfbb043d0e42508c06bbd466e9daae467642f07e540f77"
        ),
        .binaryTarget(
            name: "AgoraAudioBeautyExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraAudioBeautyExtension.xcframework.zip",
            checksum: "fd6596de33daba4d3cf1aa3232ee9af81e768b7b689bd7335b5ff463bb7c28c9"
        ),
        .binaryTarget(
            name: "AgoraVideoQualityAnalyzerExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraVideoQualityAnalyzerExtension.xcframework.zip",
            checksum: "91ad6317fa38990af67d63c1983bfabe57a5fd979e83729ae623f0873d0268da"
        ),
        .binaryTarget(
            name: "Agoraffmpeg",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/Agoraffmpeg.xcframework.zip",
            checksum: "2b7e3bc1766c318672209346cfa971d042b632589cc8a5b0d6d29851301e2b54"
        ),
        .binaryTarget(
            name: "AgoraCore",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraCore.xcframework.zip",
            checksum: "b25d87349926d4c9863af3d59bcb4088b4d14159515954a26103114df9b40234"
        ),
        .binaryTarget(
            name: "AgoraAiEchoCancellationExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraAiEchoCancellationExtension.xcframework.zip",
            checksum: "01345fa2da09d6ad96ebedc3e2e5d107b32e694fe0e55cc1e4408288a24c375a"
        ),
        .binaryTarget(
            name: "AgoraVideoSegmentationExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraVideoSegmentationExtension.xcframework.zip",
            checksum: "9f5a2f16451d2b3bfbd736ee3def5896afa2f9f3a90faba8a72e9f87ac57cf37"
        ),
        .binaryTarget(
            name: "AgoraFaceDetectionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraFaceDetectionExtension.xcframework.zip",
            checksum: "dd57cf1e3740885129303c6271197988620265b24d12d1c21f26154fc8fc7ff4"
        ),
        .binaryTarget(
            name: "AgoraRtcKit",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraRtcKit.xcframework.zip",
            checksum: "c8c5071a5a711f0ea613b36eef82a20187518b9da2e64eafea0a1f2232b9d72d"
        ),
        .binaryTarget(
            name: "video_dec",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/video_dec.xcframework.zip",
            checksum: "7a9cfb8f6e8fa9fcbc26de5cfee1571e446014919afbf40b094c4d7bbd31f4b9"
        ),
        .binaryTarget(
            name: "AgoraReplayKitExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraReplayKitExtension.xcframework.zip",
            checksum: "5273f19d4700feeda384b63a13e34998ed688f4af4c815a75ee8d3309be46332"
        ),
        .binaryTarget(
            name: "video_enc",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/video_enc.xcframework.zip",
            checksum: "d730e2f82a2bad3a8f432bacc8c48d46e1d29ffb0ae5d8c22063849829cdbace"
        ),
        .binaryTarget(
            name: "AgoraVideoEncoderExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraVideoEncoderExtension.xcframework.zip",
            checksum: "561e2f88b59982bdf3821a4fed45e6a2d8cdb8328067c5ea9e47fef24ea098c0"
        ),
        .binaryTarget(
            name: "AgoraSpatialAudioExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraSpatialAudioExtension.xcframework.zip",
            checksum: "8dc2018041746cf1ca6b8a70ca4e1b417faa2ee7216f4d718c79a7ac1ceb35d2"
        ),
        .binaryTarget(
            name: "AgoraVideoDecoderExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraVideoDecoderExtension.xcframework.zip",
            checksum: "bedcc26d8b8e3ff1f3cff5e96e411c4e274b11c6d3e9ed81be7a1ebd24ab7a74"
        ),
        .binaryTarget(
            name: "Agorafdkaac",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/Agorafdkaac.xcframework.zip",
            checksum: "832c61612bcedb18b51afe34abf661e46baadb39ad402042e378527fdf04995e"
        ),
        .binaryTarget(
            name: "AgoraContentInspectExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraContentInspectExtension.xcframework.zip",
            checksum: "21e07490c7fbaa9e33e1c3dc49531af29bf759300c227b250023b22a26c6ec59"
        ),
        .binaryTarget(
            name: "AgoraScreenCaptureExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.0/AgoraScreenCaptureExtension.xcframework.zip",
            checksum: "2cbc0d89bffae24b24f2de770cdd8857d4181132b53a9d5a02c63a33588a7d5c"
        ),
    ]
)