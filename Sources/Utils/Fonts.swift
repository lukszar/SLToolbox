//
//  Fonts.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 24/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

struct Fonts {

    /**
     List all available fonts in application.

     List is printed in console using _debugPrint()_ function.
     */
    static func printList() {

        UIFont.familyNames.forEach { familyName in
            debugPrint("\n🔤 Font family: " + familyName)
            UIFont.fontNames(forFamilyName: familyName).forEach({ (name) in
                debugPrint("== \(name)")
            })
        }
    }
}
