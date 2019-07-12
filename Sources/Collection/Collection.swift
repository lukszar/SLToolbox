//
//  Collection.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

final public class CollectionDataSource {
    public typealias RowType = AnyCellViewModel

    private(set) var sections: [Section]

    public init() {
        sections = []
    }

    public convenience init(elements: [[RowType]]) {
        self.init()
        update(with: elements)
    }

    public convenience init(elements: [RowType]) {
        self.init()
        update(with: [elements])
    }

    public func update(with models: [[RowType]]) {
        removeAllSections()
        models.forEach { (elementsArray) in
            self.appendSection({ (section) in
                section.append(contentsOf: elementsArray)
            })
        }
    }

    @discardableResult
    public func appendSection<T: Section>(with title: String? = nil, _ configure: ((T) -> Void) = { _ in }) -> T {

        let newSection = T()
        newSection.title = title
        configure(newSection)
        appendSection(newSection)

        return newSection
    }

    public func appendSection(_ section: Section) {
        sections.append(section)
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

    final public subscript(index: Int) -> Section? {
        return section(at: index)
    }

    public func element(at indexPath: IndexPath) -> RowType? {

        guard let sectionElement = section(at: indexPath.section), indexPath.row < sectionElement.numberOfRows else { return nil }

        return sectionElement.rows[indexPath.row]
    }

    public var numberOfSections: Int {
        return sections.count
    }
}

public extension CollectionDataSource {

    var viewModelTypes: [Any.Type] {
        return flattenDataSource()
            .map { type(of: $0.base).self }
    }

    /// returns all elements from all sections in 1 array.
    func flattenDataSource() -> [RowType] {
        return sections.reduce(into: [RowType]()) { (result, current) in
            return result.append(contentsOf: current.rows)
        }
    }
}
