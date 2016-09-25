//
//  Size.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/12/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import Foundation

enum Size: String {
    case SMALL = "Chica"
    case MEDIUM = "Mediana"
    case BIG = "Grande"

    static func all() -> [Size] {
        return [.SMALL, .MEDIUM, .BIG]
    }
}
