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
    static let client = CoreLocManager()
    
    private var manager = CLLocationManager()
    private var authStatus: CLAuthorizationStatus
    private var enabled: Bool
    private weak var delegate: CLLocationManagerDelegate?
    private var authorized: Bool {
        return authStatus == .authorizedAlways || authStatus == .authorizedWhenInUse
    }
    
    private init(){
        self.authStatus = CLLocationManager.authorizationStatus()
        self.enabled = CLLocationManager.locationServicesEnabled()
        self.delegate = nil
    }
    
    func getCurrentLoc()->CLLocation?{
        if authorized  && enabled {
            return manager.location
        }
        return nil
    }
    
    func setDelegate(to delegate: CLLocationManagerDelegate)->()->(){
        self.delegate = delegate
        if authorized && enabled {return { } }
        else { return CLLocationManager.requestWhenInUseAuthorization(self.manager) }
    }
}
