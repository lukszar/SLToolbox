//
//  BooksSection.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 05/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation
import SLToolbox

class BooksSection: Section {
    var rows: [BookCellViewModel] = []

    typealias Model = BookCellViewModel

    typealias Cell = BookCell
}
