//
//  BookCell+ConfigurableCell.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Generated using template created by Łukasz Szarkowicz.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//
//  SLToolbox module required for this class.

import UIKit
import SLToolbox

extension BookCell: ConfigurableCell {
    func configure(with viewModel: BookCell.ViewModel) {
        label.text = viewModel.name
    }
}

