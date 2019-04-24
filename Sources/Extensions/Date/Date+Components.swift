//
//  Date+Components.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public extension Date {

    /**
     Get second from date

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    var second: Int {
        return Calendar.current.component(.second, from: self)
    }

    /**
     Get minute from date

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }

    /**
     Get hour from date

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    /**
     Get day from date

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    /**
     Get month from date

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    /**
     Get year from date

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
}
