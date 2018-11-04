//
//  SecondViewController.swift
//  Lec6Pickers
//
//  Created by hackeru on 04/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class SlotMachineViewController: UIViewController {
    
    lazy var images:[UIImage?] = {
        var arr:[UIImage?] = []
        for i in 0...9{
            arr.append(UIImage(named: "i\(i)"))
        }
        return arr
    }()
    
   // let fruit = ["🍍", "🍌", "🍒", "🍊", "🍉", "🍓", "𝟽"]
    
    @IBOutlet weak var slotMachine: UIPickerView!
    
    @IBAction func spin(_ sender: UIButton) {

        for i in 0..<slotMachine.numberOfComponents{
            let r = Int.nextRand(max: slotMachine.numberOfRows(inComponent: i))
            
            //select row in component
            slotMachine.selectRow(r, inComponent: i, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slotMachine.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SlotMachineViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
}

extension SlotMachineViewController: UIPickerViewDelegate{

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let img = images[row % images.count] //UIImage?
        
        let iv = UIImageView(image: img)
        return iv
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
}


extension Int{
    static func nextRand(max: Int) -> Int{
        return Int(arc4random_uniform(UInt32(max)))
    }
}

// modulus:
// 0 / 3 = 0.... residue (0)
// 1 / 3 = 0.... residue (1)
// 2 / 3 = 0.... residue (2)
// 3 / 3 = 1.... residue (0)
// 4 / 3 = 1.... residue (1)
// 5 / 3 = 1.... residue (2)


//    0 % 3 = 0
//    1 % 3 = 1
//    2 % 3 = 2
//

//    mod 3















