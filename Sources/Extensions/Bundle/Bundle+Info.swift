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
     Returns name of application.

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    static var appName: String? {
        return main.object(forInfoDictionaryKey: "CFBundleName") as? String
    }

    /**
     Returns version of application. __e.g. 1.0.3__

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    static var appVersion: String? {
        return main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    /**
     Returns build number of application. __e.g. 253__

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    static var appBuild: String? {
        return main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }

    /**
     Returns identifier of application. __e.g. 253__

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    static var identifier: String? {
        return main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String
    }
}

