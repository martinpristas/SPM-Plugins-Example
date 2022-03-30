import PackagePlugin

@main struct SwiftGenPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let swiftGenConfigFile = context.package.directory.appending("swiftgen.yml")
        let genSourcesDir = context.package.directory.appending("Generated")

        return [
            .prebuildCommand(
                displayName: "Running SwiftGen",
                executable: try context.tool(named: "swiftgen").path,
                arguments: [
                    "config",
                    "run",
                    "--config",
                    "\(swiftGenConfigFile)"
                ],
                environment: [
                    "PROJECT_DIR": "\(context.package.directory)",
                    "TARGET_NAME": "\(context.package.displayName)",
                    "DERIVED_SOURCES_DIR": "\(context.pluginWorkDirectory)",
                ],
                outputFilesDirectory: context.package.directory
            ),
             /*
            .buildCommand(
                displayName: "Running SwiftGen",
                executable: try context.tool(named: "swiftgen").path,
                arguments: [
                    "config",
                    "run",
                    "--config",
                    "\(swiftGenConfigFile)"
                ],
                environment: [
                    "PROJECT_DIR": "\(context.package.directory)",
                    "TARGET_NAME": "\(context.package.displayName)",
                    "DERIVED_SOURCES_DIR": "\(context.pluginWorkDirectory)",
                ],
                inputFiles: [
                    context.package.directory.appending(subpath: "Strings.generated.swift")
                ],
                outputFiles: [
                    context.package.directory.appending(subpath: "Strings.generated.swift")
                ]
            )
            */
        ]
    }
}
