import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/
///

public struct TargetPakage {
    let name: String
    let infoPlist: [String: InfoPlist.Value]
    let dependencies: [TargetDependency]
    
    public init(
        name: String,
        infoPlist: [String: InfoPlist.Value],
        dependencies: [TargetDependency]
    ) {
        self.name = name
        self.infoPlist = infoPlist
        self.dependencies = dependencies
    }
}

extension Project {
    /// Helper function to create the Project for this ExampleApp
    public static func app(
        name: String,
        platform: Platform,
        infoPlist: [String: InfoPlist.Value],
        additionalTargets: [TargetPakage],
        dependencies: [TargetDependency]
    ) -> Project {
        var targets = makeAppTargets(name: name,
                                     platform: platform,
                                     infoPlist: infoPlist,
                                     dependencies: dependencies)
        targets += additionalTargets.flatMap({
            makeFrameworkTargets(
                name: $0.name,
                platform: platform,
                infoPlist: $0.infoPlist,
                dependencies: $0.dependencies)
        })
        return Project(
            name: name,
            organizationName: "tuist.io",
            settings: makeSettings(),
            targets: targets,
            additionalFiles: [
                .folderReference(path: .relativeToRoot("Xcconfigs/Config.xcconfig"))
            ],
            resourceSynthesizers: [
                .custom(name: "Assets", parser: .assets, extensions: ["xcassets"]),
            ]
        )
    }
    
    // MARK: - Private
    
    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(
        name: String,
        platform: Platform,
        infoPlist: [String: InfoPlist.Value],
        dependencies: [TargetDependency]
    ) -> [Target]
    {
        let sources = Target(name: name,
                             platform: platform,
                             product: .framework,
                             bundleId: "io.tuist.\(name)",
                             deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
                             infoPlist: .extendingDefault(with: infoPlist),
                             sources: ["Targets/\(name)/Sources/**"],
                             resources: ["Targets/\(name)/Resources/**"],
                             dependencies: dependencies,
                             settings: makeSettings())
        let tests = Target(name: "\(name)Tests",
                           platform: platform,
                           product: .unitTests,
                           bundleId: "io.tuist.\(name)Tests",
                           deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
                           infoPlist: .default,
                           sources: ["Targets/\(name)/Tests/**"],
                           resources: [],
                           dependencies: [.target(name: name)],
                           settings: makeSettings())
        return [sources, tests]
    }
    
    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(
        name: String,
        platform: Platform,
        infoPlist: [String: InfoPlist.Value],
        dependencies: [TargetDependency]
    ) -> [Target] {
        let platform: Platform = platform
        
        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "io.tuist.\(name)",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies,
            settings: makeSettings()
        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "io.tuist.\(name)Tests",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)")
            ],
            settings: makeSettings()
        )
        return [mainTarget, testTarget]
    }
    
    private static func makeSettings() -> Settings {
        return .settings(
            configurations: [
                .debug(name: "dev", xcconfig: .relativeToRoot("Xcconfigs/Config.xcconfig")),
                .debug(name: "stage", xcconfig: .relativeToRoot("Xcconfigs/Config.xcconfig")),
                .release(name: "prod", xcconfig: .relativeToRoot("Xcconfigs/Config.xcconfig"))
            ])
    }
}
