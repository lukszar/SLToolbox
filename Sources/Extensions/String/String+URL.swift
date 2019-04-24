//
//  String+URL.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 24/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public extension String {

    /**
     Creates URL from the string.

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    var url: URL? {
        return URL(string: self)
    }
}
