//
//  UIView+Add.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 18/07/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public extension UIView {

    /**
     Add multiple subviews to self. Provide subviews as elements not array.

     - parameter subviews: elemets to add to self

            let myView = UIView()
            let button = UIButton()
            let button2 = UIButton()

            myView.add(button, button2)
     */
    func add(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
