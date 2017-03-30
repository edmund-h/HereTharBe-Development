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
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var dataOptionsBar: UITabBar!
    @IBOutlet weak var overlayMenuButton: UIButton!
    @IBOutlet weak var tagSearchButton: UIButton!
    @IBOutlet weak var addWarningButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "HereTharBe"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

