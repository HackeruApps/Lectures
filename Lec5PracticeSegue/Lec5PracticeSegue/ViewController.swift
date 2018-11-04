//
//  ViewController.swift
//  Lec5PracticeSegue
//
//  Created by hackeru on 31/10/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cardTypeSegementedControl: UISegmentedControl!
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func stepper(_ sender: UIStepper) {
       label.text = sender.value.description
    }
    
    @IBAction func go(_ sender: UIButton) {
        let number = Int(label.text ?? "0")
            let idx = cardTypeSegementedControl.selectedSegmentIndex
        
        let title = cardTypeSegementedControl.titleForSegment(at: idx)
        
        //
    }
    @IBAction func segemented(_ sender: UISegmentedControl) {
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

