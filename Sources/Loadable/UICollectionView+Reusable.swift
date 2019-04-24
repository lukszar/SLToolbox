//
//  UICollectionView+Reusable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 23/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public extension UICollectionView {

    // MARK: - Cell

    /**
     Register a **nib-based** cell type for using in UICollectionView.

     - parameter cell: class type to register - subclass of `UICollectionViewCell` conforming `NibReusable` protocol

     - seealso: `func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String)`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UICollectionViewCell>(_ cell: T.Type) where T: NibReusable {

        register(cell.nib, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }

    /**
     Register a **class-based** cell type for using in UICollectionView.

     - parameter cell: class type to register - subclass of `UICollectionViewCell` conforming `ClassReusable` protocol

     - seealso: `func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UICollectionViewCell>(_ cell: T.Type) where T: ClassReusable {
        register(cell.self, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }

    /**
     Dequeue a reusable cell for given type (`UICollectionViewCell` subclass) conforming Reusable protocol

     - parameter indexPath: the index path defining coordinates of cell.

     - parameter cell: class type to dequeue. Subclass of `UICollectionViewCell` conforming `Reusable` protocol.

     - parameter configure: handler to configure cell after dequeue.

     - requires: cell class has to be registered before dequeue

     - seealso: `func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func dequeueReusableCell<T: UICollectionViewCell>
        (for indexPath: IndexPath,
         with cell: T.Type = T.self,
         configure: ((T) -> Void) = { _ in }) -> T where T: Reusable {

        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: indexPath) as? T else {
            let msg = """
            Failed to deque a cell view with reuse identifier: \(T.self.reuseIdentifier) and matching type: \(T.self.self)

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
     Register a **nib-based** supplementary view type for using in UICollectionView.

     - parameter supplementaryView: class type to register - subclass of `UICollectionReusableView` conforming `NibReusable` protocol

     - seealso: `func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String)`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UICollectionReusableView>(_ supplementaryView: T.Type, for kind: String) where T: NibReusable {
        register(supplementaryView.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: supplementaryView.reuseIdentifier)
    }

    /**
     Register a **class-based** supplementary view type for using in UICollectionView.

     - parameter supplementaryView: class type to register - subclass of `UICollectionReusableView` conforming `ClassReusable` protocol

     - seealso: `func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String)`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UICollectionReusableView>(_ supplementaryView: T.Type, for kind: String) where T: ClassReusable {
        register(supplementaryView.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: supplementaryView.reuseIdentifier)
    }


    /**
     Dequeue a reusable header/footer view for given type (`UITableViewHeaderFooterView` subclass) conforming Reusable protocol

     - parameter view: class type to dequeue. Subclass of `UITableViewHeaderFooterView` conforming `Reusable` protocol.

     - parameter configure: handler to configure view after dequeue.

     - requires: view class has to be registered before dequeue

     - seealso: `func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView?`

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func dequeueReusableSupplementaryView<T: UICollectionReusableView>
        (for indexPath: IndexPath,
         with view: T.Type = T.self,
         of kind: String,
         configure: ((T) -> Void) = { _ in }) -> T where T: Reusable {


        guard let view = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: view.reuseIdentifier, for: indexPath) as? T else {

            let msg = """
            Failed to deque a supplementary view with reuse identifier: \(T.self.reuseIdentifier) and matching type: \(T.self.self)

            Possible solutions:
            - check if reuseIdentifier is set in your Storyboard or XIB file,
            - check if you registered properly the view type for this collectionView

            """
            fatalError(msg)
        }

        configure(view)
        return view
    }
}
