//
//  ViewController.swift
//  HereTharBe
//
//  Created by Edmund Holderbaum on 3/28/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    weak var mapView: MKMapView!
    weak var dataOptionsBar: UITabBar!
    lazy var mapContainer: MapView = MapView()
    
    override func loadView() {
        super.loadView()
        self.view = self.mapContainer
        self.mapContainer.dataOptionsBar.delegate = self
        self.mapContainer.mapView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HereTharBe"
    }

    func configureView() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: UITabBarDelegate {
    
}

