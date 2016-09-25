//
//  Pizza.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/12/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import Foundation

class Pizza {
    var size: Size?
    var mass: Mass?
    var cheese: Cheese?
    var ingredients : [Ingredient] = []
    
    func addIngredient(_ ingredient: Ingredient) -> Bool {
        if self.ingredients.count < 5 && !self.ingredients.contains(ingredient) {
            ingredients.append(ingredient)
            return true
        }
        return false
    }
}
