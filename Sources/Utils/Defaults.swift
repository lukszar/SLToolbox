//
//  Defaults.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 24/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public class Defaults {

    static let shared = Defaults()

    public let suiteName: String?
    let userDefaults: UserDefaults

    init(suiteName: String? = Bundle.main.bundleIdentifier) {
        self.suiteName = suiteName
        self.userDefaults = UserDefaults(suiteName: suiteName) ?? UserDefaults.standard
    }

    public class Value<T: Any> {
        private var key: String
        public var value: T? {
            get {
                return Defaults.shared.userDefaults.object(forKey: key) as? T
            }

            set {
                Defaults.shared.userDefaults.set(newValue, forKey: key)
            }
        }

        public init(forKey key: String, defaultValue: T? = nil) {
            self.key = key
            if defaultValue != nil, self.value == nil {
                self.value = defaultValue
            }
        }
    }
}
