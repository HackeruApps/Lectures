//
//  ViewController.swift
//  Lec11Part3
//
//  Created by hackeru on 21/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginOrRegister: UIButton!
    
    @IBAction func toggle(_ sender: UISwitch) {
        let text = sender.isOn ? "Login" : "Register"
        loginOrRegister.setTitle(text, for: .normal)
    }
    @IBAction func loginOrRegister(_ sender: UIButton) {
        let register=sender.title(for: .normal) ?? "" == "Register"
        
        if userNameTextField.hasText && passTextField.hasText{
            let name = userNameTextField.text!
            let pass = passTextField.text!
            
            if register{
                
            }else{
                //login
            }
        }
    }
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func pickImage(_ sender: UITapGestureRecognizer) {
        //let ip = UIImagePickerController()
        let picker = UIImagePickerController()
        picker.delegate = self
        //present
        present(picker, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        
        
        let img = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = img
        picker.dismiss(animated: true)
        
     //4.2) info[UIImagePickerController.SourceType.originalImage]
    }
}













