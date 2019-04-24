//
//  UITableView+Reusable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 19/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public extension UITableView {

    // MARK: - Cell

    /**
     Register a **nib-based** cell type for using in UITableView.

     - parameter cell: class type to register - subclass of `UITableViewCell` conforming `NibReusable` protocol

     - seealso: `func register(_ nib: UINib?, forCellReuseIdentifier identifier: String)`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UITableViewCell>(_ cell: T.Type) where T: NibReusable {
        
        register(cell.nib, forCellReuseIdentifier: cell.reuseIdentifier)
    }

    /**
     Register a **class-based** cell type for using in UITableView.

     - parameter cell: class type to register - subclass of `UITableViewCell` conforming `ClassReusable` protocol

     - seealso: `func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String)`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UITableViewCell>(_ cell: T.Type) where T: ClassReusable {
        register(cell.self, forCellReuseIdentifier: cell.reuseIdentifier)
    }

    /**
     Dequeue a reusable cell for given type (`UITableViewCell` subclass) conforming Reusable protocol

     - parameter indexPath: the index path defining coordinates of cell.

     - parameter cell: class type to dequeue. Subclass of `UITableViewCell` conforming `Reusable` protocol.

     - parameter configure: handler to configure cell after dequeue.

     - requires: cell class has to be registered before dequeue

     - seealso: `func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func dequeueReusableCell<T: UITableViewCell>
        (for indexPath: IndexPath,
        with cell: T.Type = T.self,
        configure: ((T) -> Void) = { _ in }) -> T where T: Reusable {

        guard let cell = self.dequeueReusableCell(withIdentifier: cell.reuseIdentifier, for: indexPath) as? T else {
            let msg = """
            Failed to deque a supplementary view with reuse identifier: \(T.self.reuseIdentifier) and matching type: \(T.self.self)

            Possible solutions:
            - check if reuseIdentifier is set in your Storyboard or XIB file,
            - check if you registered properly the cell type for this collectionView
            """
            fatalError(msg)
        }

        configure(cell)
        return cell
    }

    // MARK: - Header / Footer View

    /**
     Register a **nib-based** header/footer type for using in UITableView.

     - parameter headerFooter: class type to register - subclass of `UITableViewHeaderFooterView` conforming `NibReusable` protocol

     - seealso: `func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String)`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UITableViewHeaderFooterView>(_ headerFooter: T.Type) where T: NibReusable {
        register(headerFooter.nib, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
    }

    /**
     Register a **class-based** header/footer type for using in UITableView.

     - parameter headerFooter: class type to register - subclass of `UITableViewHeaderFooterView` conforming `ClassReusable` protocol

     - seealso: `func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String)`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UITableViewHeaderFooterView>(_ headerFooter: T.Type) where T: ClassReusable {
        register(headerFooter.self, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
    }


    /**
     Dequeue a reusable header/footer view for given type (`UITableViewHeaderFooterView` subclass) conforming Reusable protocol

     - parameter view: class type to dequeue. Subclass of `UITableViewHeaderFooterView` conforming `Reusable` protocol.

     - parameter configure: handler to configure view after dequeue.

     - requires: view class has to be registered before dequeue

     - seealso: `func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView?`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>
        (for view: T.Type = T.self,
         configure: ((T) -> Void) = { _ in }) -> T where T: Reusable {

        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: view.reuseIdentifier) as? T else {

            let msg = """
            Failed to deque view with reuse identifier: \(T.self.reuseIdentifier) and matching type: \(T.self.self)

            Possible solutions:
                - check if reuseIdentifier is set in your Storyboard or XIB file,
                - check if you registered properly the cell type for this tableView
            """
            fatalError(msg)
        }

        configure(view)
        return view
    }
}
