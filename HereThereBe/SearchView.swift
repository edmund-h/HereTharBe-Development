//
//  searchView.swift
//  HereTharBe
//
//  Created by Edmund Holderbaum on 4/4/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    lazy var titleLabel = UILabel()
    lazy var searchBar = UISearchBar()
    lazy var tableView = UITableView()
    
    var purpose = SearchValue.none
    
    lazy var container = UIView()
    private var containerVerticalConstraint = NSLayoutConstraint()
    private var containerHorizontalConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func commonInit() {
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.piratePurple
        setContainerConstraints(to: false)
        
        titleLabel.addAndConstrainToSides(to: self.container)
        titleLabel.topAnchor.constraint(equalTo: self.container.topAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.01).isActive = true
        
        searchBar.addAndConstrainToSides(to: self.container)
        searchBar.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.01).isActive = true
        searchBar.delegate = MapSearchDelegate.client
        
        tableView.addAndConstrainToSides(to: self.container)
        tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "completionCell")
        tableView.delegate = MapSearchDelegate.client
        tableView.dataSource = MapSearchDelegate.client
    }
    
    
    func setContainerConstraints(to state: Bool){
        self.removeConstraints(self.constraints)
        if state{
            containerVerticalConstraint = NSLayoutConstraint(item: container, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
            containerHorizontalConstraint = NSLayoutConstraint(item: container, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        }
        else {
            containerVerticalConstraint = NSLayoutConstraint(item: container, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.1, constant: 0)
            containerHorizontalConstraint = NSLayoutConstraint(item: container, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.1, constant: 0)
        }
        self.addConstraints([containerVerticalConstraint, containerHorizontalConstraint])
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setPurpose(to value: SearchValue){
        self.purpose = value
        self.titleLabel.text = "Search " + self.purpose.rawValue.capitalized
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 13.0)
    }
}



