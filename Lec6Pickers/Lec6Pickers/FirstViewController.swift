//
//  FirstViewController.swift
//  Lec6Pickers
//
//  Created by hackeru on 04/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    
    let choices = [
        ["Olives", "Anchovi", "Mushrooms", "Pineapple", "Eggplants", "Fetta", "Tabasco"],["Crsuty", "Cheese Tube"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
//1st: UIPickerViewDataSource
extension FirstViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return choices.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices[component].count
    }
}
//2nd: UIPickerViewDelegate
extension FirstViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //row, component
        return choices[component][row]
    }
}

















