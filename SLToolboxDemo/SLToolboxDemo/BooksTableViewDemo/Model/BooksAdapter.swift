//
//  BooksAdapter.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

class BooksAdapter {

    typealias ViewModel = BooksActions.Get.ViewModel.Book

    static func adapt(model: Book) -> ViewModel {
        return ViewModel(name: model.title)
    }

    static func adapt(model: [Book]) -> [ViewModel] {
        return model.map { adapt(model: $0) }
    }
}
