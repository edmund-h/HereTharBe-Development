//
//  MapView.swift
//  HereTharBe
//
//  Created by Edmund Holderbaum on 3/30/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit
import MapKit
import Foundation

class MapView: UIView {
    
    lazy var mapView = MKMapView()
    
    lazy var dataOptionsTab = UIButton()
    lazy var dataOptionsBar = UITabBar()
    var dataOptionsBarIsActive = false
    fileprivate var dataVerticalConstraint = NSLayoutConstraint()
    
    lazy var tagSearchButton: MapSearchButton = MapSearchButton()
    lazy var addWarningButton: MapSearchButton = MapSearchButton()
    lazy var setLocationButton: MapSearchButton = MapSearchButton()
    lazy var centerMapButton: MapSearchButton = MapSearchButton()
    var buttons = [UIButton]()
    
    lazy var searchView: SearchView = SearchView()
    var searchViewIsActive = false
    fileprivate var searchViewVerticalConstraint = NSLayoutConstraint()
    fileprivate var searchViewHorizontalConstraint = NSLayoutConstraint()
    
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
        dataVerticalConstraint = NSLayoutConstraint(item: dataOptionsBar, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 50)
        self.addConstraint(dataVerticalConstraint)
        dataOptionsBar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        mapView.addAndConstrainToSides(to: self)
        mapView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor).isActive = true
        
        self.addSubview(dataOptionsTab)
        dataOptionsTab.translatesAutoresizingMaskIntoConstraints = false
        dataOptionsTab.heightAnchor.constraint(equalToConstant: 15).isActive = true
        dataOptionsTab.widthAnchor.constraint(equalToConstant: 35).isActive = true
        dataOptionsTab.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dataOptionsTab.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor).isActive = true
        dataOptionsTab.backgroundColor = UIColor.piratePurple
        self.insertSubview(dataOptionsTab, aboveSubview: centerMapButton)
        
        let hereBeDataButton = UITabBarItem(tabBarSystemItem: .featured , tag: 0)
        let allDataButton = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        let localDataButton = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        dataOptionsBar.items = [hereBeDataButton, allDataButton, localDataButton]
        dataOptionsBar.items?.forEach({ $0.badgeColor = UIColor.white })
        dataOptionsBar.selectedItem = hereBeDataButton
        
        tagSearchButton = MapSearchButton.addAndInitWithPuropse(being: .tags, size: 35, to: self)
        tagSearchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        tagSearchButton.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -20).isActive = true
        self.insertSubview(tagSearchButton, aboveSubview: mapView)
        
        addWarningButton = MapSearchButton.addAndInitWithPuropse(being: .warnings, size: 35, to: self)
        addWarningButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        addWarningButton.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -75).isActive = true
        self.insertSubview(tagSearchButton, aboveSubview: mapView)
        
        setLocationButton = MapSearchButton.addAndInitWithPuropse(being: .locations, size: 35, to: self)
        setLocationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        setLocationButton.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -75).isActive = true
        self.insertSubview(setLocationButton, aboveSubview: mapView)
        
        
        centerMapButton = MapSearchButton.addAndInitWithPuropse(being: .center, size: 35, to: self)
        centerMapButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        centerMapButton.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -20).isActive = true
        self.insertSubview(centerMapButton, aboveSubview: mapView)
        
        self.buttons = [addWarningButton,tagSearchButton,setLocationButton]
        
        self.addSubview(searchView)
        searchView.translatesAutoresizingMaskIntoConstraints = false
        searchView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        searchView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        searchView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        searchView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.insertSubview(searchView, belowSubview: mapView)
        searchView.backgroundColor = UIColor.clear
        MapSearchDelegate.client.setUpSearchBar(with: searchView.searchBar, and: searchView.tableView, purpose: searchView.purpose, closeout: popOutSearchView)
    }
}


// MARK: Animations
extension MapView{
    func popOutSearchView(){
        searchViewIsActive = !searchViewIsActive
        if searchViewIsActive { insertSubview(searchView, aboveSubview: mapView) }
        searchView.setContainerConstraints(to: searchViewIsActive)
        UIView.animate(withDuration: 0.4, animations: {
            self.layoutIfNeeded()
        }, completion: {_ in
            if !self.searchViewIsActive{ self.insertSubview(self.searchView, belowSubview: self.mapView) }
        })
    }
    
    func slideOutOptionsBar(){
        // this animation slides the data overlay tab bar up and down in and out of view
        if dataOptionsBarIsActive{dataVerticalConstraint.constant = 50}
        else {dataVerticalConstraint.constant = 0}
        UIView.animate(withDuration: 0.4, animations: {
            self.layoutIfNeeded()
        }, completion: {_ in
            self.dataOptionsBarIsActive = !self.dataOptionsBarIsActive
        })
    }
}

extension UIColor{
    static let piratePurple = UIColor(red: 249/255, green: 198/255, blue: 249/255, alpha: 1)
}

extension UIView{
    func addAndConstrainToSides(to view: UIView){
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
