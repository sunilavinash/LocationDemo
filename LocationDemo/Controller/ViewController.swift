//
//  ViewController.swift
//  LocationDemo
//
//  Created by MacBookPro on 04/05/21.
//

import UIKit
import MapKit
import CoreLocation
import RealmSwift


class ViewController: UIViewController,CLLocationManagerDelegate{
    @IBOutlet weak var map: MKMapView!
    var locationManager: CLLocationManager!
    let realm = try! Realm()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         if let location = locations.last{
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.map.setRegion(region, animated: true)
            print("latitude====>\(location.coordinate.latitude)")
            print("longitude====>\(location.coordinate.longitude)")
            let currentLocation = UserLocationModel()
            currentLocation.latitude = "\(location.coordinate.latitude)"
            currentLocation.longitude = "\(location.coordinate.longitude)"
            realm.beginWrite()
            realm.add(currentLocation)
            try! realm.commitWrite()
        }
    }
    
}

