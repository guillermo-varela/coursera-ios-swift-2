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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Selecciona el tipo de queso"
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.isSelected {
                cell.accessoryType = .checkmark
            }
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Total number of elements
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cheese.all().count
    }
    
    // Get cell at index
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = Cheese.all()[(indexPath as NSIndexPath).row].rawValue
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.isMember(of: IngredientTableViewController.self) {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! IngredientTableViewController
                if let selectedCheese = Cheese(rawValue: Cheese.all()[(indexPath as NSIndexPath).row].rawValue) {
                    pizza.cheese = selectedCheese
                }
                destinationViewController.pizza = pizza
            }
        }
    }
}
