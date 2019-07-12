//
//  BookCell+Interface.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Generated using template created by Łukasz Szarkowicz.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//
//  SLToolbox module required for this class.

import Foundation
import SLToolbox

extension BookCell {

    /// View Model interface for BookCell
    struct ViewModel: CellViewModel {
        typealias CellType = BookCell

        var name: String
    }
}

extension BookCell.ViewModel {

    init() {
        name = ""
    }

    init(book: Book) {
        name = book.title
    }
}
