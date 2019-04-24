//
//  CallUtil.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 24/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

/**
 This is tool for making convenient phone calls.

 Initialize object with phone number. Using the object you can check if call is available or make the call using one function.

 - Author: SLToolbox - Łukasz Szarkowicz
*/
public class CallUtil {

    /// Phone number
    private(set) var number: String

    /**
     URL created for the phone number.
     */
    var callUrl: URL? {
        return URL(string: "tel://\(self.number)")
    }

    /**
     Check if it is possible to make a phone call with given phone number.
     */
    var canCall: Bool {
        guard let url = callUrl else {
            return false
        }

        return UIApplication.shared.canOpenURL(url)
    }

    init(number: String) {
        self.number = number
    }

    /**
     Make a phone call with the phone number given during initialization.

     - parameter failureHandler: Code block executed in case of any error with phone number. Use this handler to inform user about error with calling.

     - requires: The phone number has to be correct. It can be check before with `canCall` parameter.

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    func call(_ failureHandler:(() -> Void)? = nil) {
        guard let url = callUrl, canCall == true else {
            failureHandler?()
            presentFailWarning()
            return
        }

        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    fileprivate func presentFailWarning() {
        let msg = """
        User tried to make a phone call on \(self.number) number with failure.
        Phone number is incorrect or system could not execute operation.

        Not working on simulator.
        """
        logWarning(message: msg)
    }
}
