//
//  TodosTableViewController.swift
//  Lec14Fire
//
//  Created by hackeru on 02/12/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class TodosTableViewController: UITableViewController {

    var todos:[Todo] = [] //empty array
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let user = Auth.auth().currentUser else{
            performSegue(withIdentifier: "loginSegue", sender: nil)
            return
        }
        print("Welcome, \(user.email!)")
        
        let ref = Database.database().reference(withPath: "todos")
        ref.observe(.childAdded) { (item) in
            let item = item.value as! [String: Any]
            let title = item["title"] as! String
            let desc = item["todoDescription"] as! String
            self.todos.append(Todo(title: title, todoDescription: desc))
            
            //self.tableView.reloadData()
            let indexPath = IndexPath(row: self.todos.count - 1, section: 0)
            
            DispatchQueue.main.async {
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add(_:)))
    }

    
    @objc func add(_ sender: UIBarButtonItem){
        //1) alert vc
        let alertVC = UIAlertController(title: "Add Todo", message: "Fill the data", preferredStyle: .alert)
        
        //2) add textFields
        alertVC.addTextField { (textField) in
            textField.placeholder = "Title..."
        }
        
        alertVC.addTextField { (textField) in
            textField.placeholder = "Description..."
        }
        //3) add an action -> save(...), import FirebaseDatabase
        alertVC.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            //save data to firebase
            let title = alertVC.textFields?[0].text ?? ""
            let description = alertVC.textFields?[1].text ?? ""
            
            let todo = Todo(title: title, todoDescription: description).json
            
            //ref to a json node -> +new Row
            let ref = Database.database().reference(withPath: "todos")
            
            //todos -> add row
            let newRow = ref.childByAutoId()
            
            newRow.setValue(todo, withCompletionBlock: { (err, ref) in
                if let err = err{
                    print("error: \(err)")
                }else{
                    print("done")
                }
            })
            
        }))
        
        //4) present the vc
        present(alertVC, animated: true)
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
        return todos.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let todo = todos[indexPath.row]
        
        cell.textLabel?.text = todo.title
        cell.detailTextLabel?.text = todo.todoDescription
        
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
