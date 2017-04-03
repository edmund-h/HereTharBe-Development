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
    weak var centerMapButton: UIButton!
    
    override func loadView() {
        super.loadView()
        self.view = self.mapContainer
        self.mapContainer.mapView.delegate = self
        self.configureView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HereTharBe"
    }

    func configureView() {
        mapContainer.buttons.forEach({$0.addTarget(self, action: #selector(self.getSearchBar), for: .touchUpInside) })
//        addWarningButton = self.mapContainer.addWarningButton
//        addWarningButton.addTarget(self, action: #selector(self.getSearchBar),   for: .touchUpInside)
        
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
}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: UITabBarDelegate {
    
}


