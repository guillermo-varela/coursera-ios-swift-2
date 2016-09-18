//
//  Mass.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/17/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import Foundation

enum Mass: String {
    case THIN = "Delgada"
    case CRISP = "Crujiente"
    case THICK = "Gruesa"
    
    static func all() -> [Mass] {
        return [.THIN, .CRISP, .THICK]
    }
}