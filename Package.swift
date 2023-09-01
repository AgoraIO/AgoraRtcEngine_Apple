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
            checksum: "160d8f90e1ee9427e57982f5bcbdac0227ea1b8235537a1c176f01dd80fe4d1d"
        ),
        .binaryTarget(
            name: "AgoraSoundTouch",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraSoundTouch.xcframework.zip",
            checksum: "f6a87e0ad89e5800c11a3ad1f9bc2bf9583f5e91f486c0310bfec6f2660d2592"
        ),
        .binaryTarget(
            name: "AgoraAiNoiseSuppressionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraAiNoiseSuppressionExtension.xcframework.zip",
            checksum: "d264d37483cb6a776651a4ebb86e1fe08067cf59db2225ff1a3b601ffecbc7d2"
        ),
        .binaryTarget(
            name: "AgoraClearVisionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraClearVisionExtension.xcframework.zip",
            checksum: "ece95927bfe9ce94ab173de6aa4ea1ed73c714a3d21de4399f1e08e1a558962c"
        ),
        .binaryTarget(
            name: "AgoraAudioBeautyExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraAudioBeautyExtension.xcframework.zip",
            checksum: "4b7f65d7b3721037f9a4995812ef15d0bcf23c2fb4a25bd79b28a7a5618580d1"
        ),
        .binaryTarget(
            name: "AgoraVideoQualityAnalyzerExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraVideoQualityAnalyzerExtension.xcframework.zip",
            checksum: "d21304b9f665c51abef6ef15ae2b06d53b97b8cfe78dfe45ce3cfc1bb97e3f93"
        ),
        .binaryTarget(
            name: "Agoraffmpeg",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/Agoraffmpeg.xcframework.zip",
            checksum: "33d84e0ad4643838a85657aded04210fd96ca9ec804159ad69fdb1e067615a9d"
        ),
        .binaryTarget(
            name: "AgoraCore",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraCore.xcframework.zip",
            checksum: "743b88da6b981d2710a331b5caf1d12406c4f544d2eb2f3471a33762bf0aeff8"
        ),
        .binaryTarget(
            name: "AgoraAiEchoCancellationExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraAiEchoCancellationExtension.xcframework.zip",
            checksum: "cb713354a8a4efa31f2ce32ff9f3fde60c52cdbedfea29e98ffd90317fae0313"
        ),
        .binaryTarget(
            name: "AgoraVideoSegmentationExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraVideoSegmentationExtension.xcframework.zip",
            checksum: "42de75bc1666ae2c204beb23b9cb60be2ab9fe3807413abe235ecbd00327644c"
        ),
        .binaryTarget(
            name: "AgoraFaceDetectionExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraFaceDetectionExtension.xcframework.zip",
            checksum: "5a16b00a9509f7e1ece2b2b928720eea709246e3052e03731ca126dd4447ce64"
        ),
        .binaryTarget(
            name: "AgoraRtcKit",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraRtcKit.xcframework.zip",
            checksum: "2fea70d31dd4e94b92cc582f68a8336d4ae3bd992ed3730cbfd7886b48ab6676"
        ),
        .binaryTarget(
            name: "video_dec",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/video_dec.xcframework.zip",
            checksum: "c91e70cfd7a786ab3e18ef76883834beb7acea7c06a0a8016e739312ea517e67"
        ),
        .binaryTarget(
            name: "AgoraReplayKitExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraReplayKitExtension.xcframework.zip",
            checksum: "25b4dcbb8a85c3281b64423273c5a61de6cfd972c0972cff4cb5b87dcbb09e14"
        ),
        .binaryTarget(
            name: "video_enc",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/video_enc.xcframework.zip",
            checksum: "a2c57207d631e14b2f3cb6cc0361de63744300beae70fec581a33bf45b7a8f05"
        ),
        .binaryTarget(
            name: "AgoraVideoEncoderExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraVideoEncoderExtension.xcframework.zip",
            checksum: "dca841b3f27c0add2822826e214756c0dcd20f053a0d288f91ef2cf7b41495a7"
        ),
        .binaryTarget(
            name: "AgoraSpatialAudioExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraSpatialAudioExtension.xcframework.zip",
            checksum: "b9918d8912b9302057b9eab32bcadaa88f7e5174825314ecc79a99cccf8f1801"
        ),
        .binaryTarget(
            name: "AgoraVideoDecoderExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraVideoDecoderExtension.xcframework.zip",
            checksum: "8dfa1c90d7b03c1af376d3d93a2b50e453d593d22d156bdb2fd14af67e761d4d"
        ),
        .binaryTarget(
            name: "Agorafdkaac",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/Agorafdkaac.xcframework.zip",
            checksum: "5a0c309a47117fb0394ed02094116467a9d69243bc32bb63583bfa3fc47d7669"
        ),
        .binaryTarget(
            name: "AgoraContentInspectExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraContentInspectExtension.xcframework.zip",
            checksum: "30a268660d45b50d2592aff9cce6f474ce0ffd89998d5993649e28d9b1ba4861"
        ),
        .binaryTarget(
            name: "AgoraScreenCaptureExtension",
            url: "https://github.com/AgoraIO/AgoraRtcEngine_Apple/releases/download/4.2.2/AgoraScreenCaptureExtension.xcframework.zip",
            checksum: "4bb433bf378c780d207210102dd7b70f1a2ced762a7714b6644d71760f36239c"
        ),
    ]
)