//
//  MovieCell.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 27/06/2019.
//  Generated using template created by Łukasz Szarkowicz.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//
//  SLToolbox module required for this class.

import UIKit
import SLToolbox

class MovieCell: UITableViewCell {

    // MovieCell cell's view implementation
        public var viewModel: MovieCell.ViewModel?

    @IBOutlet weak var label: UILabel!

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
