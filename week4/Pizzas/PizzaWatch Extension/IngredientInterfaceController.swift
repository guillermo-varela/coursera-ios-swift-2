//
//  IngredientInterfaceController.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/25/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import WatchKit
import Foundation


class IngredientInterfaceController: WKInterfaceController {

    @IBOutlet var ingredientsTable: WKInterfaceTable!

    var pizza: Pizza! = nil

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        pizza = context as! Pizza
        
        ingredientsTable.setNumberOfRows(Ingredient.all().count, withRowType: "IngredientTableRowController")

        for i in 0 ..< Ingredient.all().count {
            if let row = ingredientsTable.rowController(at: i) as? IngredientTableRowController {
                row.label.setText(Ingredient.all()[i].rawValue)
                row.imageMark.setImageNamed(pizza.ingredients.contains(Ingredient.all()[i]) ? "tick_mark" : nil)
            }
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        if let row = ingredientsTable.rowController(at: rowIndex) as? IngredientTableRowController {
            let ingredient: Ingredient = Ingredient.all()[rowIndex]

            if let ingredientIndex = pizza.ingredients.index(of: ingredient) {
                pizza.ingredients.remove(at: ingredientIndex)
                row.imageMark.setImageNamed(nil)
            } else {
                let added: Bool = pizza.addIngredient(ingredient)
                row.imageMark.setImageNamed(added ? "tick_mark" : nil)
                if !added {
                    let alertAction = WKAlertAction(title: "OK", style: .default, handler: {})
                    self.presentAlert(withTitle: "Ups!", message: "Máximo 5 ingredientes", preferredStyle: .alert, actions: [alertAction])
                }
            }
        }
    }

    @IBAction func nextPressed() {
        if pizza.ingredients.count <= 0 {
            let alertAction = WKAlertAction(title: "OK", style: .default, handler: {})
            self.presentAlert(withTitle: "Ups!", message: "Selecciona entre 1 y 5 ingredientes", preferredStyle: .alert, actions: [alertAction])
        } else {
            self.pushController(withName: "ConfirmationInterfaceController", context: pizza)
        }
    }
}
