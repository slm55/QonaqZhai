//
//  SearchLocationViewController.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 14.08.2022.
//

import UIKit

class SearchLocationViewController: UIViewController {
    private let searchController: UISearchController = {
        let searchController = UISearchController()
        return searchController
    }()
    
    private let resultsTableView = UITableView()
    
    private let results = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.searchController?.searchBar.becomeFirstResponder()
    }
}
