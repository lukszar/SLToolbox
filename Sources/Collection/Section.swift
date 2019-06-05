//
//  Section.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 30/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public protocol SectionProtocol: class {
    associatedtype Model
    associatedtype Cell: UITableViewCell & ConfigurableCell where Cell.ViewModelType == Model

    var rows: [Model] { get set }

}

extension SectionProtocol {

    var numberOfRows: Int {
        return rows.count
    }

    func append(contentsOf array: [Model]) {
        self.rows.append(contentsOf: array)
    }

    func append(_ element: Model) {
        self.rows.append(element)
    }
}



public class Section {

    private (set) var rows: [Element]

    init() {
        self.rows = [Element]()
    }

    var title: String?

    var numberOfRows: Int {
        return rows.count
    }

    func append(contentsOf array: [Element]) {
        self.rows.append(contentsOf: array)
    }

    func append(_ element: Element) {
        self.rows.append(element)
    }
}
