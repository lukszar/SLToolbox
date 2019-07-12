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

    override func cellType(for element: AnyHashable) -> UITableViewCell.Type {
        switch element {

        case is BookCell.ViewModel: return BookCell.self
        case is MovieCell.ViewModel: return MovieCell.self

        default: return UITableViewCell.self
        }
    }

    override func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath, with element: AnyCellViewModel) {
        switch (cell, element) {
        case let (cell as BookCell, element as BookCell.ViewModel):
            cell.configure(with: element)
        case let (cell as MovieCell, element as MovieCell.ViewModel):
            cell.configure(with: element)
        default:
            return
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let element = collection?.element(at: indexPath) as? AnyCellViewModel else {
            fatalError()
        }

        //        let theCellType = cellType(for: element.base as! AnyHashable)

        switch element.base {

        case is BookCell.ViewModel:
            let cell: BookCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(with: element.base as! BookCell.ViewModel)

            return cell

        case is MovieCell.ViewModel:

            let cell: MovieCell = tableView.dequeueReusableCell(for: indexPath) { (cell) in
                cell.configure(with: element.base as! MovieCell.ViewModel)
            }

            return cell
//            let cell: MovieCell = tableView.dequeueReusableCell(for: indexPath) as! MovieCell
//            cell.configure(with: element.base as! MovieCell.ViewModel)
//
//            return cell

        default:
            fatalError("sfdsdfsdfdsfsdfsd")
        }

    }

}

