//
//  CheeseTableViewController.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/17/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import UIKit

class CheeseTableViewController: UITableViewController {

    var pizza: Pizza!
    let reuseIdentifier = "reuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "Queso"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Selecciona el tipo de queso"
    }

    // MARK: - Table view delegate
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
        return Cheese.all().count
    }
    
    // Get cell at index
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        cell.textLabel?.text = Cheese.all()[indexPath.row].rawValue
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isMemberOfClass(IngredientTableViewController) {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destinationViewController as! IngredientTableViewController
                if let selectedCheese = Cheese(rawValue: Cheese.all()[indexPath.row].rawValue) {
                    pizza.cheese = selectedCheese
                }
                destinationViewController.pizza = pizza
            }
        }
    }
}
