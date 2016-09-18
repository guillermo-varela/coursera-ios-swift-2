//
//  Cheese.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/17/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import Foundation

enum Cheese: String {
    case MOZZARELLA = "Mozarela"
    case CHEDDAR = "Cheddar"
    case PARMESAN = "Parmesano"
    case NONE = "Sin Queso"
    
    static func all() -> [Cheese] {
        return [.MOZZARELLA, .CHEDDAR, .PARMESAN, .NONE]
    }
}