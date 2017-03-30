//
//  MapView.swift
//  HereTharBe
//
//  Created by Edmund Holderbaum on 3/30/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIView {
    
    lazy var dataOptionsBar = UITabBar()
    lazy var mapView = MKMapView()
    
    lazy var overlayMenuButton = UIButton()
    lazy var tagSearchButton = UIButton()
    lazy var addWarningButton = UIButton()
    lazy var centerMapButton = UIButton()
    
    lazy var functionsBar = UIView()
    

    
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func commonInit() {
        self.backgroundColor = UIColor.green
        self.addSubview(dataOptionsBar)
        dataOptionsBar.translatesAutoresizingMaskIntoConstraints = false
        dataOptionsBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dataOptionsBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        dataOptionsBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dataOptionsBar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    
        
        self.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        let hereBeDataButton = UITabBarItem(tabBarSystemItem: .featured , tag: 0)
        let allDataButton = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        let localDataButton = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        dataOptionsBar.items = [hereBeDataButton, allDataButton, localDataButton]
        dataOptionsBar.items?.forEach({ $0.badgeColor = UIColor.white })
        dataOptionsBar.selectedItem = hereBeDataButton
        
        self.addSubview(tagSearchButton)
        tagSearchButton.translatesAutoresizingMaskIntoConstraints = false
        tagSearchButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        tagSearchButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        tagSearchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        tagSearchButton.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -20).isActive = true
        tagSearchButton.backgroundColor = UIColor.piratePurple
        self.insertSubview(tagSearchButton, aboveSubview: mapView)
        
        self.addSubview(addWarningButton)
        addWarningButton.translatesAutoresizingMaskIntoConstraints = false
        addWarningButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        addWarningButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        addWarningButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        addWarningButton.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -75).isActive = true
        addWarningButton.backgroundColor = UIColor.piratePurple
        self.insertSubview(tagSearchButton, aboveSubview: mapView)
        
        self.addSubview(overlayMenuButton)
        overlayMenuButton.translatesAutoresizingMaskIntoConstraints = false
        overlayMenuButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        overlayMenuButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        overlayMenuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        overlayMenuButton.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -20).isActive = true
        overlayMenuButton.backgroundColor = UIColor.piratePurple
        self.insertSubview(overlayMenuButton, aboveSubview: mapView)
        
        self.addSubview(centerMapButton)
        centerMapButton.translatesAutoresizingMaskIntoConstraints = false
        centerMapButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        centerMapButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        centerMapButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        centerMapButton.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -20).isActive = true
        centerMapButton.backgroundColor = UIColor.piratePurple
        self.insertSubview(centerMapButton, aboveSubview: mapView)
        
        
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
   
    */

}

extension UIColor{
    static let piratePurple = UIColor(red: 249/255, green: 198/255, blue: 249/255, alpha: 1)
}
