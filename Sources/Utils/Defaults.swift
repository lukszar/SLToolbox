//
//  Defaults.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 24/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public class Defaults {

    public static let shared = Defaults()

    public var suiteName: String? = Bundle.main.bundleIdentifier
    var userDefaults: UserDefaults {
        return UserDefaults(suiteName: suiteName) ?? UserDefaults.standard
    }

    public class Value<T: Any>: CustomDebugStringConvertible, CustomStringConvertible {
        private var key: String
        public var value: T? {
            get { return Defaults.shared.userDefaults.object(forKey: key) as? T }
            set { Defaults.shared.userDefaults.set(newValue, forKey: key) }
        }

        public init(forKey key: String, defaultValue: T? = nil) {
            self.key = key
            if defaultValue != nil, self.value == nil {
                self.value = defaultValue
            }
        }

        public var debugDescription: String {
            let msg: String = "User defaults (suite named: \(String(describing: Defaults.shared.userDefaults))"
                + "\n   key: \(self.key)"
                + "\n   value: \(String(describing: self.value))"

            return msg
        }

        public var description: String {
            return debugDescription
        }
    }
}
