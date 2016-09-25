//
//  MassInterfaceController.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/25/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import WatchKit
import Foundation


class MassInterfaceController: WKInterfaceController {

    @IBOutlet var massTable: WKInterfaceTable!

    var pizza: Pizza! = nil

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        pizza = context as! Pizza

        massTable.setNumberOfRows(Mass.all().count, withRowType: "MassTableRowController")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        for i in 0 ..< Mass.all().count {
            if let row = massTable.rowController(at: i) as? MassTableRowController {
                let mass = Mass.all()[i]
                row.label.setText(mass.rawValue)
                row.imageMark.setImageNamed(pizza.mass == mass ? "tick_mark" : nil)
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        pizza.mass = Mass.all()[rowIndex]
        return pizza
    }
}
