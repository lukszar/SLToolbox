//
//  UIImage+Tinted.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

extension UIImage {

    /**
     Creates tinted image.

     You can use alpha component in provided UIColor, then picture will be partly covered with this color.

     - parameter color: Color used for creating tinted image

     - returns: New image covered with given color

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    func tinted(color: UIColor) -> UIImage? {
        let image = self
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: image.size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()!
        image.draw(in: rect)
        context.setFillColor(color.cgColor)
        context.setBlendMode(.sourceAtop)
        context.fill(rect)
        if let result = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return result
        } else {
            return self
        }
    }
}
