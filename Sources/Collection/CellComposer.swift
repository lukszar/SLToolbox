//
//  CellComposer.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 06/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public protocol CellConfigurator {
    associatedtype Model
    associatedtype Cell: ConfigurableCell where Cell.ViewModelType == Model

    var configureHandler: BaseCellConfigurator<Cell, Model>.Handler { get set }
}

open class BaseCellConfigurator<Cell, Model> where Cell: ConfigurableCell, Cell.ViewModelType == Model {

    public typealias Handler = (_ cell: Cell, _ model: Model) -> Void
    public var cellType: Cell.Type
    public var modelType: Model.Type

    var configureHandler: Handler

    public init(cell: Cell.Type, model: Model.Type, configure: @escaping Handler) {

        self.cellType = cell.self
        self.modelType = model.self
        self.configureHandler = configure
    }
}

//public protocol CellComposer {
//    associatedtype Model
//    associatedtype Cell: UITableViewCell & ConfigurableCell where Cell.ViewModelType == Model
//
//    func configure<Cell, Model>(view: Cell, with model: Model)
//}
//
//
//
//open class BaseCellComposer: CellComposer  {
//
//    public var cellType: Cell.Type
//    public var modelType: Model.Type
//
//    public init<Cell: ConfigurableCell, Model>(cell: Cell.Type, model: Model.Type) where Cell.ViewModelType == Model {
//        self.cellType = cell
//        self.modelType = model.self
//    }
//
//
//
//}


