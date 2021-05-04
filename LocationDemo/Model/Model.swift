//
//  Model.swift
//  LocationDemo
//
//  Created by MacBookPro on 04/05/21.
//

import Foundation
import RealmSwift
import CoreLocation

class UserLocationModel: Object {
    @objc dynamic var latitude: String = "" // optionals supported
    @objc dynamic var longitude: String = "" // optionals supported
}
