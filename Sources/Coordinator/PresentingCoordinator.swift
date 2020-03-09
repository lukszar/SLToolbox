//
//  PresentingCoordinator.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 09/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

open class PresentingCoordinator: BaseCoordinator {
    
    public var presentingViewController: UIViewController?
    
    public override init() {
        super.init()
    }
    
    public func closeView() {
        presentingViewController?.dismiss(animated: true, completion: { self.end() })
    }
}
