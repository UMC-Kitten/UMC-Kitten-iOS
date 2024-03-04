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

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(name: "Kitten",
                          platform: .iOS,
                          additionalTargets: [
                            "KittenApp",
                            "KittenUI",
                            "KittenService",
                            "KittenUtil"
                          ],
                          dependencies: dependencies)


let dependencies: [TargetDependency] = [
    .external(name: "Moya"),
    .external(name: "Alamofire"),
    .external(name: "RxMoya"),
    .external(name: "SnapKit"),
    .external(name: "RxSwift"),
    .external(name: "RxCocoa"),
    .external(name: "RxGesture"),
    .external(name: "RxDataSources"),
    .external(name: "ReactorKit"),
    .external(name: "KakaoSDKCommon"),
    .external(name: "KakaoSDKAuth"),
    .external(name: "KakaoSDKUser"),
]
