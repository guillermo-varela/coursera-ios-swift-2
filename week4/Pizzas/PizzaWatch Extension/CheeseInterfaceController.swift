//
//  CheeseInterfaceController.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/25/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import WatchKit
import Foundation


class CheeseInterfaceController: WKInterfaceController {

    @IBOutlet var cheeseTable: WKInterfaceTable!

    var pizza: Pizza! = nil

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        pizza = context as! Pizza
        
        cheeseTable.setNumberOfRows(Cheese.all().count, withRowType: "CheeseTableRowController")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        for i in 0 ..< Cheese.all().count {
            if let row = cheeseTable.rowController(at: i) as? CheeseTableRowController {
                let cheese = Cheese.all()[i]
                row.label.setText(cheese.rawValue)
                row.imageMark.setImageNamed(pizza.cheese == cheese ? "tick_mark" : nil)
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        pizza.cheese = Cheese.all()[rowIndex]
        return pizza
    }
}
