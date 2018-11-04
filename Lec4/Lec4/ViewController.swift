//
//  ViewController.swift
//  Lec4
//
//  Created by hackeru on 28/10/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //property
    let o = Oracle()
    //proeprty
    @IBOutlet var questionTF1: UITextField!
    
    @IBOutlet weak var oracleAnsLabel: UILabel!
    
    
    //Actions
    //askTapped
    @IBAction func ask(_ sender: Any /*(Any = UIButton)*/) {
        //text?
        if let text = questionTF1.text{
            //num of chars > 0
            if text.count > 0 {
                //ask the oracle
                let ans = o.askMe(question: text)
                //put the text in the label
                oracleAnsLabel.text = ans
                //clear the text for next question
                questionTF1.text = nil
            }
        }
    }
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ans = o.askMe(question: "Ma Build Failed?")
        print(ans)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

