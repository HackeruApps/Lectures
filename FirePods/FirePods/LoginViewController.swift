//
//  ViewController.swift
//  FirePods
//
//  Created by hackeru on 28/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    //Computed Properties:
    var email:String{
        return emailTextField.text ?? ""
    }
    var password:String{
        return passwordTextfield.text ?? ""
    }

    @IBAction func register(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] (user, err) in
            guard let user = user else{
                print(err ?? "Error")
                return
            }
            print(user)
            self?.performSegue(withIdentifier: "modalTable", sender: nil)
        }
    }
    @IBAction func login(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] (user, err) in
            guard let user = user else{
                print(err ?? "Error")
                return
            }
            self?.performSegue(withIdentifier: "modalTable", sender: nil)
        }
    }
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if Auth.auth().currentUser != nil{
            performSegue(withIdentifier: "modalTable", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

