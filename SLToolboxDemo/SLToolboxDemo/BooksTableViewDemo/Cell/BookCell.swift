//
//  BookCell.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Generated using template created by Łukasz Szarkowicz.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//
//  SLToolbox module required for this class.

import UIKit
import SLToolbox

class BookCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    // BookCell cell's view implementation

    override func awakeFromNib() {
        super.awakeFromNib()

        commonInit()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// Implementation of cell's styling
    fileprivate func commonInit() {
        // Provide style implementation here
    }
}

extension BookCell: NibReusable {
    
}
