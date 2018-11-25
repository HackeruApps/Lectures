//
//  PersonTableViewController.swift
//  Lec12CoreData
//
//  Created by hackeru on 25/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import CoreData

class PersonTableViewController: UITableViewController {

    var people:[Person] = []
    
    var appDelegate: AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        //init alertvc
        let alertVC = UIAlertController(title: "Add", message: "Add Person", preferredStyle: .alert)
        
        //alertVc...textfields
        alertVC.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        //alertVc...textfields
        alertVC.addTextField { (textField) in
            textField.placeholder = "LastName"
        }
        //alertVc...textfields
        alertVC.addTextField { (textField) in
            textField.placeholder = "Age"
        }
        
        //alertVC... Actions
        alertVC.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            //
            guard let name = alertVC.textFields?[0].text,
                  let lastName = alertVC.textFields?[1].text,
                  let age = alertVC.textFields?[2].text
                else{return}
            //appDelegate.addPerson()
        }))
        //present
        present(alertVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        people = appDelegate.fetchPeople()
        tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)

        // Configure the cell...
        let p = people[indexPath.row]
        
        let name = p.firstName!
        let lastName = p.lastName!
        let age = p.age
        
        cell.textLabel?.text = "\(name) - \(lastName), \(age)"
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
