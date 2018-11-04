//
//  ViewController.swift
//  Lec5Part2
//
//  Created by hackeru on 31/10/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    
    @IBAction func next(_ sender: UIButton) {
        
        if  let name = nameText.text,
            let email = emailText.text,
            let last = lastNameText.text{
            
            
            print(name, email, last)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.text = nil
        // Do any additional setup after loading the view, typically from a nib.
    }
 
    
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    //let id = segue.identifier//loginToMain
    
    //guard prevents nesting
    guard let name = nameText.text,
          let email = emailText.text,
          let last = lastNameText.text else {
        return
    }
    
    let user = User(firstName: name, lastName: last, email: email)
    
    let dest = segue.destination as? MainViewController
    
    dest?.user = user
 }
    

}






