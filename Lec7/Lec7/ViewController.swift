//
//  ViewController.swift
//  Lec7
//
//  Created by hackeru on 07/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let mGCD = GCDDemos()
        
        mGCD.goWeather { (w) in
            //label.text = w
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

