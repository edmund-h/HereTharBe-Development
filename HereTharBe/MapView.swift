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
    
    lazy var tagSearchButton = UIButton()
    lazy var addWarningButton = UIButton()
    lazy var setLocationButton = UIButton()
    lazy var centerMapButton = UIButton()
    var buttons = [UIButton]()
    
    lazy var textBar = UITextField()
    var textBarIsActive = false
    fileprivate var textBarVerticalConstraint = NSLayoutConstraint()

    
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
        self.buttons = [addWarningButton,tagSearchButton,setLocationButton]
        
        self.addSubview(dataOptionsBar)
        dataOptionsBar.translatesAutoresizingMaskIntoConstraints = false
        dataOptionsBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dataOptionsBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        dataVerticalConstraint = NSLayoutConstraint(item: dataOptionsBar, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 50)
        self.addConstraint(dataVerticalConstraint)
        dataOptionsBar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //had to build out an extra UIView to constrain the CV's frame
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsetsMake(7.5, 7.5, 7.5, 7.5)
//        layout.itemSize = CGSize(width: 35, height: 35)
//        layout.scrollDirection = .horizontal
//
        
        self.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: dataOptionsBar.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
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
        textBar.heightAnchor.constraint(equalToConstant: 35).isActive = true
        textBar.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        textBarVerticalConstraint = NSLayoutConstraint(item: textBar, attribute: .bottom, relatedBy: .equal, toItem: dataOptionsBar, attribute: .top, multiplier: 1, constant: 100)
        self.addConstraint(textBarVerticalConstraint)
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
    func slideOutActiveBar(view: UIView){
        //this animation will govern textBar slideout. The textbar will start with the same dimensions as, and hidden behind, the button activating it. Then, the bar will extend in size until it is 7/10 of the screen size and then slide out until it is centered
        // for right now it's just going to slide the bar up from under the tab bar
        if textBarIsActive {textBarVerticalConstraint.constant = 100}
        else {textBarVerticalConstraint.constant = -20}
        UIView.animate(withDuration: 0.75, animations: {
            self.layoutIfNeeded()
        }, completion: {_ in
            self.textBarIsActive = !self.textBarIsActive
        })
    }
    
    func slideOutOptionsBar(){
        // this animation slides the data overlay tab bar up and down in and out of view
        if dataOptionsBarIsActive{dataVerticalConstraint.constant = 50}
        else {dataVerticalConstraint.constant = 0}
        UIView.animate(withDuration: 0.75, animations: {
            self.layoutIfNeeded()
        }, completion: {_ in
            self.dataOptionsBarIsActive = !self.dataOptionsBarIsActive
        })
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
    
}

extension UIColor{
    static let piratePurple = UIColor(red: 249/255, green: 198/255, blue: 249/255, alpha: 1)
}

