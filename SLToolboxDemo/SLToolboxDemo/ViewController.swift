//
//  ViewController.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 24/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit
import SLToolbox

class ViewController: UIViewController {

    @IBAction func pushButtonAction(_ sender: Any) {
//        let newVC = BooksViewController.instantiate()
//        present(newVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension Defaults {

    static let firstKey = Value<String>(forKey: "myFirstKey", defaultValue: "super value")
}

extension StoryboardLoadable where Self: UIViewController {

    static var storyboardName: String {
        return String(describing: self).replacingOccurrences(of: "ViewController", with: "")
    }
}
