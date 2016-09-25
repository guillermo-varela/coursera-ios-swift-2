//
//  ConfirmationInterfaceController.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/25/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmationInterfaceController: WKInterfaceController {

    @IBOutlet var sizeLabel: WKInterfaceLabel!
    @IBOutlet var massLabel: WKInterfaceLabel!
    @IBOutlet var cheeseLabel: WKInterfaceLabel!
    @IBOutlet var ingredientsLabel: WKInterfaceLabel!

    var pizza: Pizza! = nil

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        pizza = context as! Pizza

        sizeLabel.setText(pizza.size?.rawValue)
        massLabel.setText(pizza.mass?.rawValue)
        cheeseLabel.setText(pizza.cheese?.rawValue)
        ingredientsLabel.setText(pizza.ingredients.map({$0.rawValue}).joined(separator: ", "))
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func confirm() {
        let alertAction = WKAlertAction(title: "OK", style: .default, handler: {})
        self.presentAlert(withTitle: "Confirmación", message: "La pizza será preparada!", preferredStyle: .alert, actions: [alertAction])
    }
}
