//
//  ViewController.swift
//  Lec11Part2
//
//  Created by hackeru on 21/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var dialogView: UIView!
    @IBAction func plus(_ sender: UIBarButtonItem) {
        //add dialogView as a Sub View
        self.dialogView.center = self.view.center
        self.view.addSubview(dialogView)
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBAction func addTodo(_ sender: UIButton) {
        let title = titleTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        let date = datePicker.date
        
        let defaults = UserDefaults.standard
        
        defaults.set(title, forKey: "title")
        defaults.set(description, forKey: "description")
        defaults.set(date, forKey: "date")
        
        dialogView.removeFromSuperview()
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = UserDefaults.standard
        
        let title = defaults.string(forKey: "title") ?? ""
        let desc = defaults.string(forKey: "description") ?? ""
        let date = defaults.object(forKey: "date") as? Date ?? Date()
        
        print(title, desc, date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

