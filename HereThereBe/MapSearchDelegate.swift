//
//  MapSearchDelegate.swift
//  HereTharBe
//
//  Created by Edmund Holderbaum on 4/9/17.
//  Copyright © 2017 Bozo Design Labs. All rights reserved.
//

import UIKit
import CoreLocation

final class MapSearchDelegate: NSObject, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    private var results = [CLPlacemark]()
    
    static var client = MapSearchDelegate()
    weak var searchBar: UISearchBar?
    weak var tableView: UITableView?
    lazy var searchFunction: SearchValue = .none
    var closeOutSearchBar: () -> ()
    
    private override init() {
        closeOutSearchBar = {}
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completionCell", for: indexPath) 
        var address = String()
        let cellCheck = indexPath.row % 2 == 0
        if cellCheck { cell.backgroundColor = UIColor.cyan }
        guard let dict = results[indexPath.row].addressDictionary else {return cell}
        print (dict)
        dict.keys.forEach({
            if let element = $0.base as? String {
                address.append("\(element) ")
            }
        })
        cell.textLabel?.text = address
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchFunction == .locations{
            CoreLocManager.forwardGeocodeToCompletions(text: searchText, completion: { placemarks in
                DispatchQueue.main.async {
                    self.results = placemarks
                    self.tableView!.reloadData()
                }
            })
        }
    }
    
    func setUpSearchBar(with bar: UISearchBar, and tableView: UITableView, purpose: SearchValue, closeout: @escaping ()->() ){
        self.searchBar = bar
        self.tableView = tableView
        self.searchFunction = purpose
        self.closeOutSearchBar = closeout
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //this will have to get passed on to the appropriate client
        searchBar.resignFirstResponder()
        closeOutSearchBar()
        searchBar.text = ""
    }
}

enum SearchValue: String{
    case tags, warnings, locations, center, none = ""
}

enum SourceAPI{
    case hereTharBe, both, three11
    
    //this will be a veritable class unto its own with information about what api(s) to call with requests and how to turn tags into the proper search terms & parameters
    //this will depend on the options bar and it will depend on what is selected in the dataOptionsBar
    
}
