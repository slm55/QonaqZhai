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
        searchController.searchBar.showsCancelButton = false
        let textField = searchController.searchBar.searchTextField
        textField.backgroundColor = .systemBackground
        textField.placeholder = "Enter destination"
        textField.layer.borderWidth = 6
        textField.layer.cornerRadius = 4
        textField.layer.borderColor = UIColor.orange.cgColor
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "chevron.left")
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let button = UIButton()
        button.configuration = configuration
        textField.leftView = button
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        textField.centerXAnchor.constraint(equalTo: searchController.searchBar.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: searchController.searchBar.widthAnchor, constant: -32).isActive = true
        return searchController
    }()
    
    private let resultsTableView = UITableView()
    
    private let results = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.searchController?.searchBar.becomeFirstResponder()
    }
}
