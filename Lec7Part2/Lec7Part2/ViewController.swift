//
//  ViewController.swift
//  Lec7Part2
//
//  Created by hackeru on 07/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ds = ItunesDataSource()

        ds.getSongs { (songs) in
            //songs is an array
            print(songs)
        }
        
    }
}

