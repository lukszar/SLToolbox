//
//  Date+ISOString.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public extension Date {

    /**
     Create date based on string in ISO format

     - parameter isoString: Sting containing date in ISO format

     - returns: Date generated from string

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    static func date(from isoString: String) -> Date? {

        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        return dateFormatter.date(from: isoString)
    }
}
