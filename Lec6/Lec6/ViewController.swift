//
//  ViewController.swift
//  Lec6
//
//  Created by hackeru on 04/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func datePicked(_ sender: UIDatePicker) {
        let d = sender.date
        
        let c = Calendar(identifier: .gregorian)
        
        //print: year, month, day, hour, min
        let year = c.component(.year, from: d)
        let month = c.component(.month, from: d)
        let day = c.component(.day, from: d)
        
        let hour = c.component(.hour, from: d)
        let min = c.component(.minute, from: d)
        
        print(year, month, day, hour, min)
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

