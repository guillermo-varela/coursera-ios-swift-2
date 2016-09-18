//
//  IngredientTableViewController.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/17/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import UIKit

class IngredientTableViewController: UITableViewController {

    var pizza: Pizza!
    let reuseIdentifier = "reuseIdentifier"
    let limit = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "Ingredientes"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Selecciona de uno a cinco ingredientes"
    }

    // MARK: - Table view delegate
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            if selectedRows.count == limit {
                let alertController = UIAlertController(title: "Ups", message: "Sólo puedes seleccionar \(limit) hasta ingredientes", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in}))
                self.presentViewController(alertController, animated: true, completion: nil)
                return nil
            }
        }

        return indexPath
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.selected {
                cell.accessoryType = .Checkmark
            }
        }
    }

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .None
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Total number of elements
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ingredient.all().count
    }
    
    // Get cell at index
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = Ingredient.all()[indexPath.row].rawValue
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isMemberOfClass(ConfirmationViewController) {
            let destinationViewController = segue.destinationViewController as! ConfirmationViewController
            if let selectedRows = tableView.indexPathsForSelectedRows {
                pizza.ingredients = []
                for row in selectedRows {
                    pizza.ingredients.append(Ingredient(rawValue: Ingredient.all()[row.row].rawValue)!)
                }
            }
            destinationViewController.pizza = pizza
        }
    }

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            if (selectedRows.count < 1) {
                let alertController = UIAlertController(title: "Ups", message: "Debes indicar al menos un ingrediente", preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in}))
                self.presentViewController(alertController, animated: true, completion: nil)
                return false
            }
        } else {
            let alertController = UIAlertController(title: "Ups", message: "Debes indicar al menos un ingrediente", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in}))
            self.presentViewController(alertController, animated: true, completion: nil)
            return false
        }
        return true
    }
}
