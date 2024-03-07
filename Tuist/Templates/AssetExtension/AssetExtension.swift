import ProjectDescription
import AppKit
import Foundation

/// Deprecated: asset을 주입할 방법이 없으므로 ResourceSynthesizers 사용
let template = Template(
    description: "AssetExtension template",
    attributes: [
//        .custom(name: "Assets", parser: .assets, extensions: ["xcassets"]),
    ],
    items: [
        .file(
            path: "Asset+Extension.swift",
            templatePath: "AssetExtension.stencil"
        )
    ]
)
