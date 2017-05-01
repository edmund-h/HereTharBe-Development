//
//  MapSearchButton.swift
//  HereTharBe
//
//  Created by Edmund Holderbaum on 4/9/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class MapSearchButton: UIButton {
    
    var purpose: SearchValue = .none
    
    class func addAndInitWithPuropse(being value: SearchValue, size: CGFloat, to view: UIView)-> MapSearchButton {
        
        let newButton = MapSearchButton()
        newButton.purpose = value
        let title = value.rawValue.uppercased()
        newButton.accessibilityLabel = title
        newButton.accessibilityIdentifier = title
        if let letter = title.characters.first{
            newButton.setTitle("\(letter)", for: .normal)
        }
        
        view.addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.widthAnchor.constraint(equalToConstant: size).isActive = true
        newButton.heightAnchor.constraint(equalToConstant: size).isActive = true
        newButton.backgroundColor = UIColor.piratePurple
        return newButton
    }

}
