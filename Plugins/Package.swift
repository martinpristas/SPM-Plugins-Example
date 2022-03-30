// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Plugins",
    products: [
        .executable(name: "command-runner", targets: ["command-runner"]),
        .plugin(name: "RswiftPlugin", targets: ["RswiftPlugin"]),
        .plugin(name: "SwiftLintPlugin", targets: ["SwiftLintPlugin"]),
        .plugin(name: "SwiftGenPlugin", targets: ["SwiftGenPlugin"])
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
        .executableTarget(name: "command-runner"),
        .plugin(
            name: "SwiftGenPlugin",
            capability: .command(intent: .custom(verb: "Some plugin verb", description: "Some plugin description"), permissions: [
                .writeToPackageDirectory(reason: "Because I would like to generate files there")]),
            dependencies: [
                "swiftgen"
            ]
        ),
        .binaryTarget(
            name: "swiftgen",
            url: "https://github.com/nicorichard/SwiftGen/releases/download/6.5.1/swiftgen.artifactbundle.zip",
            checksum: "a8e445b41ac0fd81459e07657ee19445ff6cbeef64eb0b3df51637b85f925da8"
        ),
    ]
)
