// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIComponents",
    defaultLocalization: "en",
    products: [
        .library(name: "UIComponents", targets: ["UIComponents"])
    ],
    dependencies: [
        .package(name: "Plugins", path: "../Plugins"),
    ],
    targets: [
        .target(
            name: "UIComponents",
            resources: [
                .process("Resources")
            ],
            plugins: [
                .plugin(name: "RswiftPlugin", package: "Plugins"),
                .plugin(name: "SwiftLintPlugin", package: "Plugins")
            ]),
        .testTarget(
            name: "UIComponentsTests",
            dependencies: ["UIComponents"]),
    ]
)
