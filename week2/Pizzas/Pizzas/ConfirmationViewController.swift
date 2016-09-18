//
//  ConfirmationViewController.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/17/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var cheeseLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!

    var pizza: Pizza!

    override func viewWillAppear(animated: Bool) {
        sizeLabel.text = pizza.size?.rawValue
        massLabel.text = pizza.mass?.rawValue
        cheeseLabel.text = pizza.cheese?.rawValue
        ingredientsLabel.text = pizza.ingredients.map({$0.rawValue}).joinWithSeparator(", ")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Confirmación"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func preparePizza(sender: AnyObject) {
        let alertController = UIAlertController(title: "Nueva Pizza", message: "La pizza será preparada!", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in}))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
