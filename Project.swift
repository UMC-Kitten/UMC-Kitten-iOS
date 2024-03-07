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
    //    .external(name: "Moya"),
    //    .external(name: "Alamofire"),
    //    .external(name: "SnapKit"),
    //    .external(name: "RxSwift"),
    //    .external(name: "ReactorKit"),
    //    .external(name: "KakaoSDKCommon"),
    //    .external(name: "KakaoSDKAuth"),
    //    .external(name: "KakaoSDKUser"),
    //    .xcframework(path: "NaverThirdPartyLogin.xcframework"),
    .target(name: "KittenUI"),
    .target(name: "KittenUtil"),
    .target(name: "KittenService"),
]

let infoPlist: [String: InfoPlist.Value] = [
    "API_BASE_URL": "http://$(API_BASE_URL)",
    "CFBundleURLTypes": [
        [
            "CFBundleTypeRole": "Editor",
            "CFBundleURLName": "",
            "CFBundleURLSchemes": ["kakao285a30d5a95fcb36e240649e8b722479"]
        ],
        [
            "CFBundleTypeRole": "Editor",
            "CFBundleURLName": "naverauth",
            "CFBundleURLSchemes": ["naverq4yYq9GqZvWRQnbf8S1h"]
        ],
        [
            "CFBundleTypeRole": "Editor",
            "CFBundleURLName": "kitten",
            "CFBundleURLSchemes": ["kitten"]
        ]
    ],
    "KAKAO_AUTH_APP_KEY": "$(KAKAO_AUTH_APP_KEY)",
    "LSApplicationQueriesSchemes": [
        "kakaoplus",
        "kakaokompassauth",
        "kakaolink",
        "naversearchapp",
        "naversearchthirdlogin"
    ],
    "NSAppTransportSecurity": [
        "NSAllowArbitraryLoads": true
    ],
    "UIAppFonts": [
        "Pretendard-Black.otf",
        "Pretendard-Bold.otf",
        "Pretendard-ExtraBold.otf",
        "Pretendard-ExtraLight.otf",
        "Pretendard-Light.otf",
        "Pretendard-Medium.otf",
        "Pretendard-Regular.otf",
        "Pretendard-SemiBold.otf",
        "Pretendard-Thin.otf"
    ],
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": true,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default Configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate",
                ]
            ]
        ]
    ]
]


// Creates our project using a helper function defined in ProjectDescriptionHelpers
let targets = [
    TargetPakage(
        name: "KittenUI",
        infoPlist: infoPlist,
        dependencies: [
            .target(name: "KittenUtil"),
            .target(name: "KittenService"),
            .external(name: "Moya"),
            //            .external(name: "Alamofire"),
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
        infoPlist: infoPlist,
        dependencies: [
            .target(name: "KittenUtil"),
            .external(name: "Moya"),
            //            .external(name: "Alamofire"),
        ]
    ),
    TargetPakage(
        name: "KittenUtil",
        infoPlist: infoPlist,
        dependencies: [
            .external(name: "RxSwift"),
            .external(name: "KakaoSDKCommon"),
            .external(name: "KakaoSDKAuth"),
            .external(name: "KakaoSDKUser"),
            .xcframework(path: "NaverThirdPartyLogin.xcframework"),
        ]
    ),
]


let project = Project.app(
    name: "Kitten",
    platform: .iOS,
    infoPlist: infoPlist,
    additionalTargets: targets,
    dependencies: dependencies)


