//
//  CoreLocManager.swift
//  HereTharBe
//
//  Created by Edmund Holderbaum on 4/3/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import Foundation
import CoreLocation

final class CoreLocManager{
    private static let client = CoreLocManager()
    
    private var manager: CLLocationManager
    private var authStatus: CLAuthorizationStatus
    private var enabled: Bool
    weak var delegate: CLLocationManagerDelegate?
    
    var authorized: Bool {
        let always = authStatus == .authorizedAlways
        let whenInUse = authStatus == .authorizedWhenInUse
        return always || whenInUse
    }
    
    
    private init (){
        self.manager = CLLocationManager()
        self.authStatus = CLLocationManager.authorizationStatus()
        self.enabled = CLLocationManager.locationServicesEnabled()
        manager.startUpdatingLocation()
    }
    
    class func authCheckRequest() {
        if client.authorized && client.enabled {return}
        self.client.manager.requestWhenInUseAuthorization()
    }
    
    class func forwardGeocodeFullAddress(address: String, completion: @escaping (CLPlacemark?)->()) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemark, error in
            completion(placemark?.first)
        }
    }
    
    class func forwardGeocodeToCompletions(text: String, completion: @escaping ([CLPlacemark])->()) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(text, completionHandler: { placemarks, error in
            completion( placemarks ?? [CLPlacemark]() )
        })
    }
    
    class func reverseGeocode(coordinate: CLLocationCoordinate2D, completion: @escaping (CLPlacemark?)->()){
        let geocoder = CLGeocoder()
        let loc = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        geocoder.reverseGeocodeLocation(loc, completionHandler: { placemark, error in
            completion(placemark?.first)
        })
    }

    class func getCurrentLoc()->CLLocation?{
        if client.authorized  && client.enabled {
            return client.manager.location
        }
        return nil
    }
}
