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

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Selecciona el tamaño de la pizza"
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
        return Size.all().count
    }

    // Get cell at index
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)

        cell.textLabel?.text = Size.all()[indexPath.row].rawValue

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController.isMemberOfClass(MassTableViewController) {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destinationViewController as! MassTableViewController
                if let selectedSize = Size(rawValue: Size.all()[indexPath.row].rawValue) {
                    pizza.size = selectedSize
                }
                destinationViewController.pizza = pizza
            }
        }
    }
}
