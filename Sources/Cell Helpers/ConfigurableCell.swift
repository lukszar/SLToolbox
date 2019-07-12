//
//  ConfigurableCell.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public typealias CellViewModel = Hashable & ConfigurationProvider

public protocol ConfigurableCell {
    associatedtype ViewModelType: CellViewModel where ViewModelType.CellType == Self

    func configure(with viewModel: ViewModelType)
}

public protocol ConfigurationProvider {
    associatedtype CellType: ConfigurableCell where Self == CellType.ViewModelType
    var cellType: CellType.Type { get }

    func configure(cell: CellType)
}

public extension ConfigurationProvider {
    var cellType: CellType.Type {
        return CellType.self
    }

    func configure(cell: CellType) {
        cell.configure(with: self)
    }
}
