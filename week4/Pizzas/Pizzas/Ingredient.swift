//
//  Ingredient.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/17/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import Foundation

enum Ingredient: String {
    case JAM = "Jamón"
    case PEPPERONI = "Pepperoni"
    case TURKEY = "Pavo"
    case SAUSAGE = "Salchicha"
    case OLIVES = "Aceituna"
    case ONION = "Cebolla"
    case PEPPER = "Pimiento"
    case PINEAPPLE = "Piña"
    case ANCHOVIES = "Anchoa"
    
    static func all() -> [Ingredient] {
        return [.JAM, .PEPPERONI, .TURKEY, .SAUSAGE, .OLIVES, .ONION, .PEPPER, .PINEAPPLE, .ANCHOVIES]
    }
}