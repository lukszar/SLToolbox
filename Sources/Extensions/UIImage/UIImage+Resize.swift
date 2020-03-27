//
//  UIImage+Resize.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 24/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public extension UIImage {

    /**
     Resize UIImage with given factor.

     - parameter factor: Value used to resize UIImage. F.ex. 0.5 equals 50%.

     - returns: Resized UIImage.

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    func resized(with factor: CGFloat) -> UIImage? {

        let newSize: CGSize = CGSize(width: size.width * factor, height: size.height * factor)
        let newFrame: CGRect = CGRect(origin: .zero, size: newSize)
        let imageView = UIImageView(frame: newFrame)

        imageView.contentMode = .scaleAspectFit
        imageView.image = self

        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()

        return result
    }
    
    func resized(to targetSize: CGSize) -> UIImage? {

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Find smaller ratio to use in resizing
        // Output image's width and height won't be bigger that provided in target size
        let useRatio = widthRatio < heightRatio ? widthRatio : heightRatio
        
        // Create cropping size
        var newSize = CGSize(width: size.width * useRatio, height: size.height * useRatio)
        
        // Create rect with new size
        let rect = CGRect(origin: CGPoint.zero, size: newSize)

        // Make image resizing
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
