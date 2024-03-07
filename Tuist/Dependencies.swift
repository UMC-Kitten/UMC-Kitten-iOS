import ProjectDescription

let spm = SwiftPackageManagerDependencies(
    [
        .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMajor(from: "15.0.0")),
        .remote(url: "https://github.com/SnapKit/SnapKit.git", requirement: .upToNextMajor(from: "5.0.0")),
        .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMajor(from: "6.5.0")),
        .remote(url: "https://github.com/RxSwiftCommunity/RxGesture.git", requirement: .upToNextMajor(from: "4.0.0")),
        .remote(url: "https://github.com/pixeldock/RxAppState.git", requirement: .branch("master")),
        .remote(url: "https://github.com/ReactorKit/ReactorKit.git", requirement: .upToNextMajor(from: "3.2.0")),
        .remote(url: "https://github.com/kakao/kakao-ios-sdk", requirement: .upToNextMajor(from: "2.11.0")),
        .remote(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", requirement: .branch("main")),
    ],
    baseSettings: .settings(configurations: [
        .debug(name: "dev", xcconfig: .relativeToRoot("Xcconfigs/Config.xcconfig")),
        .debug(name: "stage", xcconfig: .relativeToRoot("Xcconfigs/Config.xcconfig")),
        .release(name: "prod", xcconfig: .relativeToRoot("Xcconfigs/Config.xcconfig"))
    ])
)

let dependencies = Dependencies(
    swiftPackageManager: spm,
    platforms: [.iOS]
)

