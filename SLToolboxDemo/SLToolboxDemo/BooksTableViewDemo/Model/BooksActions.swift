//
//  BooksActions.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

enum BooksActions {
    enum Get {
        struct Request { }
        struct Response {
            var books: [Book]
        }
        struct ViewModel { }
    }
}
