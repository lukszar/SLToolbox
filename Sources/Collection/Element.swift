//
//  Element.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

//public protocol Element { }

public struct AnyCellViewModel {

    public var base: Any
    private let equals: (Any) -> Bool

    public init<H>(_ base: H) where H : Hashable {

        self.base = base
        self.equals = { $0 as? H == base }
    }
}

extension AnyCellViewModel: Equatable {
    public static func == (lhs: AnyCellViewModel, rhs: AnyCellViewModel) -> Bool {
        return lhs.equals(rhs.base)
    }
}

extension AnyCellViewModel: CustomStringConvertible {
    public var description: String {
        return String(describing: base)
    }
}
