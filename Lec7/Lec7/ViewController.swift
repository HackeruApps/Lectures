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
  
        let gcd = GCDDemos()
        
        gcd.goWeather { temp in
            //label.text = temp
        }
        
        //...
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

