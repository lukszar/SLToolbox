//
//  Bundle+Info.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 24/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public extension Bundle {

    /**
     Returns display name of application.

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    static var displayName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
