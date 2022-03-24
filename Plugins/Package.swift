// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Plugins",
    products: [
        .executable(name: "command-runner", targets: ["command-runner"]),
        .plugin(name: "RswiftPlugin", targets: ["RswiftPlugin"]),
        .plugin(name: "SwiftLintPlugin", targets: ["SwiftLintPlugin"])
    ],
    dependencies: [],
    targets: [
        .plugin(
            name: "RswiftPlugin",
            capability: .buildTool(),
            dependencies: [
                "command-runner"
            ]
        ),
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool(),
            dependencies: [
                "command-runner"
            ]
        ),
        .executableTarget(name: "command-runner")
    ]
)
