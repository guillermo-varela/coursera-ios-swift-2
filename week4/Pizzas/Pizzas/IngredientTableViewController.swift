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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Selecciona de uno a cinco ingredientes"
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            if selectedRows.count == limit {
                let alertController = UIAlertController(title: "Ups", message: "Sólo puedes seleccionar \(limit) hasta ingredientes", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in}))
                self.present(alertController, animated: true, completion: nil)
                return nil
            }
        }

        return indexPath
    }

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
        return Ingredient.all().count
    }
    
    // Get cell at index
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = Ingredient.all()[(indexPath as NSIndexPath).row].rawValue
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.isMember(of: ConfirmationViewController.self) {
            let destinationViewController = segue.destination as! ConfirmationViewController
            if let selectedRows = tableView.indexPathsForSelectedRows {
                pizza.ingredients = []
                for row in selectedRows {
                    pizza.ingredients.append(Ingredient(rawValue: Ingredient.all()[(row as NSIndexPath).row].rawValue)!)
                }
            }
            destinationViewController.pizza = pizza
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any!) -> Bool {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            if (selectedRows.count < 1) {
                let alertController = UIAlertController(title: "Ups", message: "Debes indicar al menos un ingrediente", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in}))
                self.present(alertController, animated: true, completion: nil)
                return false
            }
        } else {
            let alertController = UIAlertController(title: "Ups", message: "Debes indicar al menos un ingrediente", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in}))
            self.present(alertController, animated: true, completion: nil)
            return false
        }
        return true
    }
}
