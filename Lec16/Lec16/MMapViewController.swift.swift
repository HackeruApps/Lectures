//
//  ViewController.swift
//  Lec16
//
//  Created by hackeru on 09/12/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import MapKit

class MMapViewController: UIViewController, MLocationManagerDelegate {
    func location(_ location: CLLocation) {
        //TODO: use location to show on map
        
        
        //4.2: let region = MKCoordinateRegion.init(location.coordinate, latitudeInMeters: 100, longitudeInMeters: 100)
        
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, 100, 100)
            
        mapView.setRegion(region, animated: true)
    }
    
   
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
        //register self as delegate
        MLocationManager.sharedInstance.delegate = self
        mapView.showsUserLocation = true
        //mapView.showsCompass = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            guard let location = CLLocationManager().location else{return}
            let coordinate = location.coordinate
            
            
            let annotation = PizzaAnnotation(coordinate: coordinate,
                                             title: "Pizza-Pizza",
                                             subtitle: "pitzush"
            )
            
            //add the annotation to the map:
            mapView.addAnnotation(annotation)
        }
    }
}

extension MMapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        
        //more efficient
        //let view = mapView.dequeueReusableAnnotationView(withIdentifier: "pizza", for: annotation) as? MKPinAnnotationView
        
       // if view == nil{
            let v = MKAnnotationView(annotation: annotation, reuseIdentifier: "pizza")
        
            
        
        
            v.image = UIImage(named: "pizza50")
            v.backgroundColor = UIColor.clear
            v.canShowCallout = true
           // pin.pinTintColor = UIColor.purple
            return v
      //  }
       // return view
    }
    
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













