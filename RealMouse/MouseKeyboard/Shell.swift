//
//  Shell.swift
//  RealMouse
//
//  Created by Josh Bedwell on 4/23/22.
//

import Foundation

class Shell {
    static func shell(_ command: String) throws -> String {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["-c", command]
        task.executableURL = URL(fileURLWithPath: "/bin/zsh")

        try task.run()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }
    
    static func altShell(_ command: String) throws -> String {
        let task = Process()
        let pipe = Pipe()
        
        var comps = command.components(separatedBy: " ")
        let first = comps.removeFirst()
        
        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = comps
        task.executableURL = URL(fileURLWithPath: first)

        try task.run()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }
}
