//
//  Logger.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

fileprivate class Logger {

    enum LogLevel {
        case error
        case warning
        case success

        var title: String {
            switch self {
            case .error:
                return "\n❌ Error occured:"
            case .warning:
                return "\n⚠️ Warning occured:"
            case .success:
                return "\n✅ Success occured:"
            }
        }
    }

    static func print(function: String, file: String, line: Int, message: String?, level: LogLevel) {
        let fileName = file.components(separatedBy: "/").last ?? "Could not detect file"

        let msgDescription = message ?? "No message included"

        let msg = level.title
            + "\n   function: \(function)"
            + "\n   file: \(fileName)"
            + "\n   line: \(line)"
            + "\n   message: \(msgDescription)"
        debugPrint(msg)
    }
}

func logError(_ function: String = #function, file: String = #file, line: Int = #line, message: String? = nil) {
    #if DEBUG
    Logger.print(function: function, file: file, line: line, message: message, level: .error)
    #endif
}

func logWarning(_ function: String = #function, file: String = #file, line: Int = #line, message: String? = nil) {
    #if DEBUG
    Logger.print(function: function, file: file, line: line, message: message, level: .warning)
    #endif
}

func logSuccess(_ function: String = #function, file: String = #file, line: Int = #line, message: String? = nil) {
    #if DEBUG
    Logger.print(function: function, file: file, line: line, message: message, level: .success)
    #endif
}
