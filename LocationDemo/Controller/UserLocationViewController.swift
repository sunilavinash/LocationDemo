//
//  UserLocationViewController.swift
//  LocationDemo
//
//  Created by MacBookPro on 04/05/21.
//

import UIKit
import MapKit
import CoreLocation
import RealmSwift


class UserLocationViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
        // Do any additional setup after loading the view.
    }
    
    func getLocation(){
        let userLocations = realm.objects(UserLocationModel.self)
        for location in userLocations{
            let point = MKPointAnnotation()

            let pointlatitude = Double(location.latitude)!
            let pointlongitude = Double(location.longitude)!
            point.coordinate = CLLocationCoordinate2DMake(pointlatitude ,pointlongitude)
            map.addAnnotation(point)
        }
        if userLocations.count > 0 {
            let last = userLocations.last
            let coordinate = CLLocationCoordinate2D(latitude: Double(last!.latitude)!, longitude: Double(last!.longitude)!)
            let region = self.map.regionThatFits(MKCoordinateRegion(center: coordinate, latitudinalMeters: 10, longitudinalMeters: 10))
            self.map.setRegion(region, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
