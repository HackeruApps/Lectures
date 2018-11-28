//
//  ViewController.swift
//  Lec13Sqlite
//
//  Created by hackeru on 28/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        query("SELECT * FROM Characters WHERE id=?", 2)
    }
    
    
    func query(_ sql:String,_ args:Any...){
        print(sql)
        
        for a in args{
            print(a)
            if a is Int{
                print(a)
            }
        }
    }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

