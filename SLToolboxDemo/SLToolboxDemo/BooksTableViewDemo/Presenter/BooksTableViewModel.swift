//
//  BooksTableViewModel.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit
import SLToolbox

class BooksTableViewModel: TableViewModel {

    var configurators: [CellConfigurator] = {

        let book = BaseCellConfigurator(cell: BookCell.self, model: BookCellViewModel.self) { (cell, model) in
            cell.configure(with: model)
        }

        return [book as! CellConfigurator]
    }()

    override func registerCells() {
        guard let table = delegate?.tableView else { return }

        table.register(BookCell.self)
    }

    func cellType(for model: Element) -> UITableViewCell.Type {

        switch model {
        case is BookCellViewModel:
            return BookCell.self

        default:
            return UITableViewCell.self
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let element = collection?.element(at: indexPath) else { return UITableViewCell() }

        switch element {

        case is BookCellViewModel:
            return tableView.dequeueReusableCell(for: indexPath, with: BookCell.self) { (cell) in
                cell.configure(with: element as! BookCellViewModel)
            }

        default:
            return UITableViewCell()

        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        guard let model = collection?.element(at: indexPath) else { return 0.0 }
        let type = cellType(for: model) as? HeightProvided.Type

        return type?.providedHeight ?? 0.0
    }
}
