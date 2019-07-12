//
//  MovieCell+ConfigurableCell.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 27/06/2019.
//  Generated using template created by Łukasz Szarkowicz.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//
//  SLToolbox module required for this class.

import UIKit
import SLToolbox

extension MovieCell: ConfigurableCell {
    func configure(with viewModel: MovieCell.ViewModel) {

        self.label.text = viewModel.time
        // Provide implementation for configuring MovieCell with MovieCellViewModel.
    }
}
