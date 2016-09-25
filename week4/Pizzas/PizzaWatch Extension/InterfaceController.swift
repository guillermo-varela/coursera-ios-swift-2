//
//  InterfaceController.swift
//  PizzaWatch Extension
//
//  Created by Guillermo Varela on 9/25/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    var pizza: Pizza! = Pizza()

    @IBOutlet var sizeTable: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // Configure interface objects here.
        sizeTable.setNumberOfRows(Size.all().count, withRowType: "SizeTableRowController")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        for i in 0 ..< Size.all().count {
            if let row = sizeTable.rowController(at: i) as? SizeTableRowController {
                let size = Size.all()[i]
                row.label.setText(size.rawValue)
                row.imageMark.setImageNamed(pizza.size == size ? "tick_mark" : nil)
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        pizza.size = Size.all()[rowIndex]
        return pizza
    }
}
