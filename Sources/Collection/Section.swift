//
//  Section.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 30/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public extension CollectionDataSource {
    class Section {

        public var title: String?

        private(set) var rows: Array<RowType>

        public required init(title: String? = nil, rows: [RowType]? = nil) {
            self.rows = rows ?? []
            self.title = title
        }

        final public var numberOfRows: Int {
            return rows.count
        }

        final public func append(contentsOf array: [RowType]) {
            self.rows.append(contentsOf: array)
        }

        final public func append(_ element: RowType) {
            self.rows.append(element)
        }

        final public func removeAll() {
            self.rows.removeAll()
        }

        final public subscript(index: Int) -> RowType? {
            if index < rows.count {
                return self.rows[index]
            } else {
                return nil
            }
        }
    }
}



