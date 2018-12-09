//
//  MLocationManager.swift
//  Lec16
//
//  Created by hackeru on 09/12/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import Contacts
//import MapKit



//delegate:
@objc
protocol MLocationManagerDelegate {
    @objc optional func location(_ location: CLLocation)
    @objc optional func doWork()
    
}

class MLocationManager:NSObject {
    //singleton
    private override init(){
        super.init()
        lm.delegate = self
        
        
    }
    public static let sharedInstance = MLocationManager()
    
    
    //Delegate:
    var delegate: MLocationManagerDelegate? //many[]
    
    let geoCoder = CLGeocoder()
    
    func address(location: CLLocation){
        
        //guard let last = lm.location
        geoCoder.reverseGeocodeLocation(location) { (places, err) in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            
            guard let place = places?.first else{return}
            
            let street = place.postalAddress?.street ?? "no street"
            let city = place.postalAddress?.street ?? "no city"
            let country = place.postalAddress?.country ?? "no country"
            
            DispatchQueue.main.async {
                print(street, city, country)
            }
        }
    }
    
    
    func geoCode(address:String){
        
        //guard let last = lm.location
        geoCoder.geocodeAddressString(address) { (places, err) in
            if let err = err{
                print(err.localizedDescription)
                return
            }
            
            guard let place = places?.first else{return}
            
            DispatchQueue.main.async {
                print(place.location?.coordinate ?? "")
            }
        }
    }
    
    
    
    
    //1) protocol,
    //2) delgate var,
    //3) notify the delegate
    //4)register a ViewController as delegate
    
    //MVC
    
    
    //retained:
    let lm = CLLocationManager()
    
    var hasAuthorization:Bool{
        var isAuthorized = false
        
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            isAuthorized = false
        case .restricted:
            isAuthorized = false
        case .denied:
            isAuthorized = false
        case .authorizedAlways:
            isAuthorized = true
        case .authorizedWhenInUse:
            isAuthorized = true
        }
        
        return isAuthorized
    }
    
    func locationEnabled()->Bool{
        return CLLocationManager.locationServicesEnabled()
    }

    func demo(){
        //location manager!
      //  lm.requestAlwaysAuthorization()
    }
}


extension MLocationManager: CLLocationManagerDelegate{
    
    func requestLocationUpdates(){
        //describe the request:
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Have Permissions!")
            requestLocationUpdates()
            //lm.requestLocation()
            
        case .notDetermined:
            print("Not Yet... Have Faith :)")
            lm.requestAlwaysAuthorization()
        default:
            print("No Go...")
            //app settings
            //Homework: show custom dialog b4
            
            //swift4.2: UIApplicationOpen.settingsURLString
            let url = URL(string: UIApplicationOpenSettingsURLString)!
            //open settings url
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed with error:", error)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations.first!)
        DispatchQueue.main.async {[weak self] in
            self?.delegate?.location?(locations.first!)
        }
    }
    
    
}











