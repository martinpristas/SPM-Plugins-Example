//
//  File.swift
//  
//
//  Created by Martin Pristas on 24.03.2022.
//

import Foundation

@discardableResult
func shell(_ command: String) -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    return output
}

let arguments = CommandLine.arguments

print("== Running command ==")
print("Arguments:\n")
arguments.forEach { print("\($0)\n") }
print(shell(arguments[1]))
print("== END ==")
