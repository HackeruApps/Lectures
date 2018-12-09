//
//  OtherViewController.swift
//  Lec16
//
//  Created by hackeru on 09/12/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import CoreLocation

class MLocationViewController: UIViewController, MLocationManagerDelegate {
    func location(_ location: CLLocation) {
        //DispatchQueue
        locationLabel.text = "\(location.coordinate)"
        
        locationLabel.sizeToFit()
    }
    
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MLocationManager.sharedInstance.delegate = self
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
