//
//  Book.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

struct Book {

    var title: String
}

extension Book {
    static var dumpData: [Book] {
        let books = Array(1...6).map { (number) -> Book in
            return Book(title: "Name \(number)")
        }
        return books
    }
}

struct Movie {

    var time: Int
}

extension Movie {
    static var dumpData: [Movie] {
        let movies = Array(1...6).map { (number) -> Movie in
            return Movie(time: number)
        }
        return movies
    }
}
