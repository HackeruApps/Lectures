//
//  ViewController.swift
//  Lec14Fire
//
//  Created by hackeru on 02/12/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let auth = Auth.auth()
        
        //test userDefaults if we already saved a user.
        //email, userID
        
        
        //no user? -> go login
        guard let user = auth.currentUser else{
            performSegue(withIdentifier: "loginSegue", sender: nil)
            return
        }
        //else -> print(hello, email)
        print("Hello, \(user.email)" )
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

