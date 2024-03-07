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

// MARK: - Dependencies

let appTargetDependencies: [TargetDependency] = [
    .target(name: "KittenUI"),
    .target(name: "KittenUtil"),
    .target(name: "KittenService"),
]

// MARK: - Info.plist

let baseInfoPlist: [String: InfoPlist.Value] = [
    "API_BASE_URL": "http://$(API_BASE_URL)",
]

let appTargetInfoPlist: [String: InfoPlist.Value] = [
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
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default Configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate",
                ]
            ]
        ]
    ],
    "UILaunchStoryboardName": "LaunchScreen.storyboard",
    "UISupportedInterfaceOrientations": [
        "UIInterfaceOrientationPortrait",
    ]
]

func makeInfoPlist(_ targetInfoPlist: [String: InfoPlist.Value]) -> [String: InfoPlist.Value] {
    return baseInfoPlist.merging(targetInfoPlist) { (_, new) in new }
}

// MARK: - Target

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let targets = [
    TargetPakage(
        name: "KittenUI",
        infoPlist: baseInfoPlist,
        dependencies: [
            .target(name: "KittenUtil"),
            .target(name: "KittenService"),
            .external(name: "Moya"),
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
        infoPlist: baseInfoPlist,
        dependencies: [
            .target(name: "KittenUtil"),
            .external(name: "Moya"),
        ]
    ),
    TargetPakage(
        name: "KittenUtil",
        infoPlist: baseInfoPlist,
        dependencies: [
            .external(name: "RxSwift"),
            .external(name: "KakaoSDKCommon"),
            .external(name: "KakaoSDKAuth"),
            .external(name: "KakaoSDKUser"),
            .xcframework(path: "NaverThirdPartyLogin.xcframework"),
        ]
    ),
]

// MARK: - Project

let project = Project.app(
    name: "Kitten",
    platform: .iOS,
    infoPlist: makeInfoPlist(appTargetInfoPlist),
    additionalTargets: targets,
    dependencies: appTargetDependencies)


