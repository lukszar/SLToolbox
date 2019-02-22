//
//  String+Date.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public extension String {
    /**
     Generate date based on given string in ISO format

     compare with:
     _date(from isoString: String) -> Date?_

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    public func date() -> Date? {
        return Date.date(from: self)
    }
}
