import ProjectDescription

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
                          additionalTargets: ["KittenUI", "KittenService", "KittenUtil"])
