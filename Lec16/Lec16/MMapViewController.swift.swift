//
//  ViewController.swift
//  Lec16
//
//  Created by hackeru on 09/12/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import MapKit

class MMapViewController: UIViewController {
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        switch index {
        case 0:
            mapView.mapType = .satellite
        case 1:
            mapView.mapType = .standard
        default:
            mapView.mapType = .hybrid
           
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!{
        didSet{
            mapView.mapType = .satellite
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         MLocationManager.sharedInstance.demo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MMapViewController: MKMapViewDelegate{
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("Map Loaded")
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //new location:
        print("Did Update user location")
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("Selected an annotation")
    }
    
}













