//
//  CellConfigurable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public protocol CellConfigurable {
    associatedtype ViewModelType

    func configure(with viewModel: ViewModelType?)
}
