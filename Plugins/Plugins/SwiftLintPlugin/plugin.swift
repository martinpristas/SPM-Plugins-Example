//
//  File.swift
//  
//
//  Created by Martin Pristas on 24.03.2022.
//

import PackagePlugin
import Foundation

@main
struct SomePlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        // let genSourcesDir = context.pluginWorkDirectory
        let tool = try context.tool(named: "command-runner")
        
        return [
            .buildCommand(
                displayName: "SwiftLintPlugin running here!",
                executable: tool.path,
                arguments: ["$SRCROOT/../Binaries/swiftlint"],
                environment: [:]
            )
        ]
    }
}
