//
//  MovieCell+Interface.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 27/06/2019.
//  Generated using template created by Łukasz Szarkowicz.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//
//  SLToolbox module required for this class.

import Foundation
import SLToolbox

/// View Model interface for MovieCell

extension MovieCell {

    struct ViewModel: CellViewModel {
        typealias CellType = MovieCell

        var time: String
    }
}
extension MovieCell.ViewModel {

    init() {
        time = "0"
    }

    init(movie: Movie) {
        time = "\(movie.time)"
    }
}
