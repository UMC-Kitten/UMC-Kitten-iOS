import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains Sample App target and Sample unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

let dependencies: [TargetDependency] = [
    .external(name: "Moya"),
    .external(name: "Alamofire"),
    .external(name: "SnapKit"),
    .external(name: "RxSwift"),
    .external(name: "ReactorKit"),
    .external(name: "KakaoSDKCommon"),
    .external(name: "KakaoSDKAuth"),
    .external(name: "KakaoSDKUser"),
    .xcframework(path: "NaverThirdPartyLogin.xcframework"),
    .target(name: "KittenUI"),
    .target(name: "KittenUtil"),
    .target(name: "KittenService"),
]

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let targets = [
    TargetPakage(
        name: "KittenUI",
        dependencies: [
            .target(name: "KittenUtil"),
            .target(name: "KittenService"),
            .external(name: "Moya"),
            .external(name: "Alamofire"),
            .external(name: "SnapKit"),
            .external(name: "RxSwift"),
            .external(name: "RxCocoa"),
            .external(name: "RxGesture"),
            .external(name: "RxDataSources"),
            .external(name: "RxAppState"),
            .external(name: "ReactorKit"),
        ]
    ),
    TargetPakage(
        name: "KittenService",
        dependencies: [
            .target(name: "KittenUtil"),
            .external(name: "Moya"),
            .external(name: "Alamofire"),
        ]
    ),
    TargetPakage(
        name: "KittenUtil",
        dependencies: [
            .external(name: "RxSwift"),
            .external(name: "KakaoSDKCommon"),
            .external(name: "KakaoSDKAuth"),
            .external(name: "KakaoSDKUser"),
        ]
    ),
  ]

let project = Project.app(name: "Kitten",
                          platform: .iOS,
                          additionalTargets: targets,
                          dependencies: dependencies)

