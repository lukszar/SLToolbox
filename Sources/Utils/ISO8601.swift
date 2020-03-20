//
//  ISO8601.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 20/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import Foundation


public class ISO8601 {
    
    /// Singleton for keeping one instance of Formatter in memory
    static private let shared = ISO8601()
    
    
    @available(iOS 11.0, *)
    lazy var newFormatter: NewISO8601Formatter = {
        NewISO8601Formatter()
    }()
    
    /// For system version lower than iOS 11.0
    lazy var oldFormatter: OldISO8601Formatter = {
        OldISO8601Formatter()
    }()

    private init() {}
    
    public static func date(from string: String) -> Date? {
        
        if #available(iOS 11.0, *) {
            return shared.newFormatter.date(from: string)
        } else {
            return shared.oldFormatter.date(from: string)
        }
    }
}

class OldISO8601Formatter {
    
    /// Formatter for ISO8601 with milliseconds
    lazy var iso8601FormatterWithMilliseconds: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return dateFormatter
    }()
    
    /// Formatter for ISO8601 without milliseconds
    lazy var iso8601Formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        return dateFormatter
    }()
    
    
    func date(from string: String) -> Date? {
        if let date = iso8601Formatter.date(from: string) {
            return date
        } else if let date = iso8601FormatterWithMilliseconds.date(from: string) {
            return date
        } else {
            logWarning(message: "Could not parse date \(string)")
            return nil
        }
    }
}


@available(iOS 11.0, *)
class NewISO8601Formatter {
    
    /// Formatter for ISO8601 with milliseconds
    lazy var iso8601FormatterWithMilliseconds: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        
        // GMT or UTC -> UTC is standard, GMT is TimeZone
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.formatOptions = [.withInternetDateTime, .withDashSeparatorInDate, .withColonSeparatorInTime, .withTimeZone, .withFractionalSeconds]
        
        return formatter
    }()
    
    /// Formatter for ISO8601 without milliseconds
    lazy var iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        
        // GMT or UTC -> UTC is standard, GMT is TimeZone
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.formatOptions = [.withInternetDateTime, .withDashSeparatorInDate, .withColonSeparatorInTime, .withTimeZone]
        
        return formatter
    }()
    
    func date(from string: String) -> Date? {
        if let date = iso8601Formatter.date(from: string) {
            return date
        } else if let date = iso8601FormatterWithMilliseconds.date(from: string) {
            return date
        } else {
            logWarning(message: "Could not parse date \(string)")
            return nil
        }
    }
}
