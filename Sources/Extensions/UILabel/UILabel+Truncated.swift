//
//  UILabel+Truncated.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public extension UILabel {

    /**
     Check if Label is truncated or it fits in frame.

     If __yes__, means that all text is visible. If __no__, means that label is truncated.

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    public var isTruncated: Bool {
        guard let labelText = text else {
            return false
        }

        let maxSize = CGSize(width: frame.size.width, height: .greatestFiniteMagnitude)

        let labelTextSize = (labelText as NSString).boundingRect(
            with: maxSize,
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil).size

        return labelTextSize.height > bounds.size.height
    }
}
