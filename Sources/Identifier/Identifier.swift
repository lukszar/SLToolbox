//
//  Identifier.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 18/07/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

/**
 Identifier type is a wrapper for storing object's identifiers. It can store various types, including: __Int__, __String__, __UUID__ etc.

 Identifier includes information whith which type is associated.

 Default RawIdentifier is __String__

 Example 1: Int type Identifier

     struct Person: Identifiable {
     let id: Identifier<Person>
     let name: String
     let age: Int

     typealias RawIdentifier = Int
     }

     let gregory = Person(id: 1, name: "Gregory", age: 37)

 Example 2: UUID type Identifier

     struct Person: Identifiable {
     let id: Identifier<Person>
     let name: String
     let age: Int

     typealias RawIdentifier = UUID
     }

     let gregory = Person(id: Identifier<Person>(UUID()), name: "Gregory", age: 37)
 */
public struct Identifier<T: Identifiable> {

    public typealias ValueType = T.RawIdentifier
    public let rawValue: ValueType

    public init(_ rawValue: ValueType) {
        self.rawValue = rawValue
    }
}

extension Identifier: Hashable {
    public static func == (lhs: Identifier<T>, rhs: Identifier<T>) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension Identifier: ExpressibleByUnicodeScalarLiteral where T.RawIdentifier == String {
    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }

    public typealias UnicodeScalarLiteralType = String
}

extension Identifier: ExpressibleByExtendedGraphemeClusterLiteral where T.RawIdentifier == String {
    public typealias ExtendedGraphemeClusterLiteralType = String

}

extension Identifier: ExpressibleByStringLiteral where T.RawIdentifier == String {

    public init(stringLiteral value: String) {
        self = Identifier<T>(value)
    }
}

extension Identifier: CustomStringConvertible {
    public var description: String {
        return String(describing: rawValue)
    }
}

extension Identifier: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(type(of: rawValue)): " + String(describing: rawValue)
    }
}

extension Identifier: ExpressibleByIntegerLiteral where T.RawIdentifier == Int {
    public typealias IntegerLiteralType = Int

    public init(integerLiteral value: Int) {
        rawValue = value
    }
}

extension Identifier: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(T.RawIdentifier.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}


/**
 See: Identifier<T: Identifiable>
 */
public protocol Identifiable {
    associatedtype RawIdentifier: Codable & Hashable = String

    var id: Identifier<Self> { get }
}
