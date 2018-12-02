//
//  LoginViewController.swift
//  Lec14Fire
//
//  Created by hackeru on 02/12/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    let auth = Auth.auth()
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
  
    
    func loginOrReg(_ sender: UIButton){
        let email = emailTextField.text ?? ""
        let pass = passwordTextField.text ?? ""
        
        //functions in swift are first class citizens
        //let create = auth.createUser
        
        let completion: AuthResultCallback = { (user, err) in
            
            if let err = err{
                print(err)
                return
            }
            
            if let _ = user{
                self.dismiss(animated: true)
            }
        }
        
        if sender.title(for: .normal) == "Login"{
            auth.createUser(withEmail: email, password: pass, completion: completion)
        }else{
            auth.signIn(withEmail: email, password: pass, completion: completion)
        }
    }
    
    @IBAction func login(_ sender: UIButton) {
        let email = emailTextField.text ?? ""
        let pass = passwordTextField.text ?? ""
        
        auth.signIn(withEmail: email, password: pass) { (user, err) in
            
            if let err = err{
                print(err)
                return
            }
            
            if let _ = user{
                self.dismiss(animated: true)
            }
        }
    }
    @IBAction func register(_ sender: UIButton) {
        let email = emailTextField.text ?? ""
        let pass = passwordTextField.text ?? ""
        
        auth.createUser(withEmail: email, password: pass) { (user, err) in
           
            if let err = err{
                print(err)
                return
            }
            
            if let _ = user{
                self.dismiss(animated: true)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
