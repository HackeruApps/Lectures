//
//  ViewController.swift
//  Lec10Part2
//
//  Created by hackeru on 18/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //var h:CGFloat = 0
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
//        {
//        didSet{
//            h = heightConstraint.constant
//        }
//    }
    var isMenuOpen:Bool{
        return heightConstraint.constant != 0
    }
    
    @IBAction func toggle(_ sender: UIBarButtonItem) {
        heightConstraint.constant = isMenuOpen ? 0 : 150 //
        
        //animate
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 20, options: [], animations: {
            
            self.view.layoutIfNeeded()
        })
//        UIView.animate(withDuration: 0.4){
//            //animate the constraints
//            self.view.layoutIfNeeded()
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? IconsCollectionViewController else {
            return
        }
        dest.delegate = self
    }
}
extension ViewController: IconsCollectionViewControllerDelegate{
    func didSelectIcon(_ icon: UIImage) {
        let imageView = UIImageView(image: icon)
        view.addSubview(imageView)
    }
}










