//
//  SizeTableViewController.swift
//  Pizzas
//
//  Created by Guillermo Varela on 9/12/16.
//  Copyright © 2016 Guillermo Varela. All rights reserved.
//

import UIKit

class SizeTableViewController: UITableViewController {

    let reuseIdentifier = "reuseIdentifier"
    let pizza: Pizza = Pizza()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        self.title = "Tamaño"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Selecciona el tamaño de la pizza"
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
        return Size.all().count
    }

    // Get cell at index
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        cell.textLabel?.text = Size.all()[(indexPath as NSIndexPath).row].rawValue

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.isMember(of: MassTableViewController.self) {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! MassTableViewController
                if let selectedSize = Size(rawValue: Size.all()[(indexPath as NSIndexPath).row].rawValue) {
                    pizza.size = selectedSize
                }
                destinationViewController.pizza = pizza
            }
        }
    }
}
