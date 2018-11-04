//
//  ViewController.swift
//  Lec4Part4
//
//  Created by hackeru on 28/10/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redLabel.text = "Red: \(sender.value)"
        changeColor()
    }
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenLabel.text = "Green: \(sender.value)"
        changeColor()
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueLabel.text = "Blue: \(sender.value)"
        changeColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeColor()
     
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func changeColor(){
        let red = CGFloat(redSlider.value) / 255
        let green = CGFloat(greenSlider.value) / 255
        let blue = CGFloat(blueSlider.value) / 255
        
        
        let redHexString = String(Int(redSlider.value), radix: 16)
        let greenHexString = String(Int(greenSlider.value), radix: 16)
        let blueHexString = String(Int(blueSlider.value), radix: 16)
        
        
        
        print("#\(redHexString)" + greenHexString + blueHexString)
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}














