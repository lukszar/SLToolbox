//
//  UITableViewCell+HeightProvided.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 10/05/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public protocol HeightProvided: UITableViewCell {

    static var providedHeight: CGFloat { get }
    static var providedEstimatedHeight: CGFloat { get }
}
