//
//  Collection.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

final public class Collection {

    private var sections: [Section]

    public init() {
        sections = []
    }

    public convenience init(elements: [[Element]]) {
        self.init()
        update(with: elements)
    }

    public convenience init(elements: [Element]) {
        self.init()
        update(with: [elements])
    }

    public func update(with models: [[Element]]) {
        sections = []
        models.forEach { (elementsArray) in
            let section = Section()
            section.append(contentsOf: elementsArray)
            sections.append(section)
        }
    }

    public func removeAllSections() {
        sections = []
    }

    public func removeSection(_ section: Int) {
        sections.remove(at: section)
    }

    public func section(at index: Int) -> Section? {
        guard index < numberOfSections else { return nil }

        return sections[index]
    }

    public func element(at indexPath: IndexPath) -> Element? {
        guard let sectionElement = section(at: indexPath.section), indexPath.row < sectionElement.numberOfRows else { return nil }

        return sectionElement.rows[indexPath.row]
    }

    public var numberOfSections: Int {
        return sections.count
    }

    public func numberOfRowsInSection(_ section: Int) -> Int {
        guard section < numberOfSections else { return 0 }

        return sections[section].numberOfRows
    }
}

