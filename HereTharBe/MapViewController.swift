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
    lazy var mapContainer: MapView = MapView()
    weak var dataOptionsBar: UITabBar!
    
    override func loadView() {
        super.loadView()
        self.view = self.mapContainer
        self.mapContainer.mapView.delegate = self
        self.configureView()
        let request = CoreLocManager.client.setDelegate(to: self)
        request()
        mapContainer.mapView.setUserTrackingMode(.follow, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HereTharBe"
    }

    func configureView() {
        self.mapContainer.buttons.forEach({$0.addTarget(self, action: #selector(self.getSearchBar), for: .touchUpInside) })
        self.mapContainer.centerMapButton.addTarget(self, action: #selector(self.centerMap), for: .touchUpInside)
        self.mapContainer.dataOptionsTab.addTarget(self, action: #selector(self.getDataOptions), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSearchBar(sender: UIButton){
        self.mapContainer.slideOutActiveBar(view: sender)
    }
    
    func getDataOptions(){
        self.mapContainer.slideOutOptionsBar()
    }
    
    func centerMap(sender: UIButton){
        if let clLoc = CoreLocManager.client.getCurrentLoc() {
            let center = clLoc.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion.init(center: center, span: span)
            mapContainer.mapView.setRegion(region, animated: true)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let clLoc = locations.last {
            let center = clLoc.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion.init(center: center, span: span)
            mapContainer.mapView.setRegion(region, animated: true)
        }
    }
}

extension MapViewController: UITabBarDelegate {
    
}



