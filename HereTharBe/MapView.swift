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
    
    lazy var dataOptionsBar = UITabBar()
    lazy var mapView = MKMapView()
    
    lazy var tagSearchButton = UIButton()
    lazy var addWarningButton = UIButton()
    lazy var setLocationButton = UIButton()
    lazy var centerMapButton = UIButton()
    
    lazy var textBar = UITextField()

    
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
        dataOptionsBar.heightAnchor.constraint(equalToConstant: 35).isActive = true
        dataOptionsBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        dataOptionsBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dataOptionsBar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //had to build out an extra UIView to constrain the CV's frame
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(7.5, 7.5, 7.5, 7.5)
        layout.itemSize = CGSize(width: 35, height: 35)
        layout.scrollDirection = .horizontal

        
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
        constrainToLowerRightButtonSlot(item: tagSearchButton)
        tagSearchButton.backgroundColor = UIColor.piratePurple
        tagSearchButton.setTitle("T", for: .normal)
        self.insertSubview(tagSearchButton, aboveSubview: mapView)
        
        self.addSubview(addWarningButton)
        addWarningButton.translatesAutoresizingMaskIntoConstraints = false
        constrainToUpperRightButtonSlot(item: addWarningButton)
        addWarningButton.backgroundColor = UIColor.piratePurple
        addWarningButton.setTitle("W", for: .normal)
        self.insertSubview(tagSearchButton, aboveSubview: mapView)
        
        self.addSubview(setLocationButton)
        setLocationButton.translatesAutoresizingMaskIntoConstraints = false
        constrainToUpperLeftButtonSlot(item: setLocationButton)
        setLocationButton.backgroundColor = UIColor.piratePurple
        setLocationButton.setTitle("L", for: .normal)
        self.insertSubview(setLocationButton, aboveSubview: mapView)
        
        self.addSubview(centerMapButton)
        centerMapButton.translatesAutoresizingMaskIntoConstraints = false
        constrainToLowerLeftButtonSlot(item: centerMapButton)
        centerMapButton.backgroundColor = UIColor.piratePurple
        centerMapButton.setTitle("C", for: .normal)
        self.insertSubview(centerMapButton, aboveSubview: mapView)
        
        self.addSubview(textBar)
        textBar.translatesAutoresizingMaskIntoConstraints = false
        constrainToActiveBarSlot(item: textBar)
        textBar.backgroundColor = UIColor.piratePurple
        self.insertSubview(textBar, aboveSubview: mapView)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
   
    */

}


// MARK: Animations
extension MapView{
    func activateAddWarning() {
        // this animation will bring the addWarning button down while sliding the tagSearch button out of view, then slide out the textBar from underneath its location
    }
    
    func activateSetLocation(){
        //this animation will bring the setLocation button down while sliding the centerMap button out of view, then slide out the textBar from underneath its location
    }
    
    func slideOutSearchBar(){
        //this animation will govern textBar slideout. The textbar will start with the same dimensions as, and hidden behind, the button activating it. Then, the bar will extend in size until it is 7/10 of the screen size and then slide out until it is centered
    }
    
    
}

// MARK: Constraints as positions

extension MapView{
    func constrainToUpperRightButtonSlot(item: UIView) {
        item.heightAnchor.constraint(equalToConstant: 35).isActive = true
        item.widthAnchor.constraint(equalToConstant: 35).isActive = true
        item.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        item.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -75).isActive = true
        
    }
    
    func constrainToLowerRightButtonSlot(item: UIView) {
        item.heightAnchor.constraint(equalToConstant: 35).isActive = true
        item.widthAnchor.constraint(equalToConstant: 35).isActive = true
        item.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        item.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -20).isActive = true
        
    }
    
    func constrainToUpperLeftButtonSlot(item: UIView) {
        item.heightAnchor.constraint(equalToConstant: 35).isActive = true
        item.widthAnchor.constraint(equalToConstant: 35).isActive = true
        item.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        item.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -75).isActive = true
        
    }
    
    func constrainToLowerLeftButtonSlot(item: UIView) {
        item.heightAnchor.constraint(equalToConstant: 35).isActive = true
        item.widthAnchor.constraint(equalToConstant: 35).isActive = true
        item.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        item.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -20).isActive = true
    }
    
    func constrainToActiveBarSlot(item:UIView) {
        item.heightAnchor.constraint(equalToConstant: 35).isActive = true
        item.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        item.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        item.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor, constant: -20).isActive = true
    }
    
}

extension UIColor{
    static let piratePurple = UIColor(red: 249/255, green: 198/255, blue: 249/255, alpha: 1)
}

