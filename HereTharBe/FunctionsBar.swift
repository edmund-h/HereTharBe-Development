//
//  FunctionsBar.swift
//  HereTharBe
//
//  Created by Edmund Holderbaum on 3/30/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class FunctionsBar: UIView {
    
    lazy var show: BarType = .none
    
    lazy var textField = UITextField()
    lazy var overlayCollection = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setFunction(to: .none)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(){
        
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        self.addSubview(overlayCollection)
        overlayCollection.translatesAutoresizingMaskIntoConstraints = false
        overlayCollection.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        overlayCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        overlayCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        overlayCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        self.backgroundColor = UIColor.red
    }
    
    func setFunction(to setting: BarType){
        switch setting{
        case .none:
            textField.isHidden = true
            overlayCollection.isHidden = true
            return
        case .location:
            textField.isHidden = false
            self.insertSubview(textField, aboveSubview: overlayCollection)
            overlayCollection.isHidden = true
            return
        case .tag:
            textField.isHidden = false
            self.insertSubview(textField, aboveSubview: overlayCollection)
            overlayCollection.isHidden = true
            return
        case .overlay:
            textField.isHidden = true
            self.insertSubview(textField, belowSubview: overlayCollection)
            overlayCollection.isHidden = true
            return
        }
    }
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
    

}

enum BarType: Int{
    case none = 0, location, tag, overlay
}
