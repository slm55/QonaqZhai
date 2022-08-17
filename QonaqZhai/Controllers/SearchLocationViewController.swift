//
//  SearchLocationViewController.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 14.08.2022.
//

import UIKit

class SearchLocationViewController: UIViewController {
    private let searchBar = UISearchBar()
    
    private let resultsTableView = UITableView()
    
    private let results = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(searchBar)
        setupSearchBar()
        setupTableView()
    }
    
    private func setupSearchBar(){
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        let textField = searchBar.searchTextField
        textField.backgroundColor = .systemBackground
        textField.placeholder = "Enter destination"
        textField.layer.borderWidth = 6
        textField.layer.cornerRadius = 4
        textField.layer.borderColor = UIColor.orange.cgColor
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "chevron.left")
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        configuration.baseForegroundColor = .label
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        button.configuration = configuration
        textField.leftView = button
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        textField.centerXAnchor.constraint(equalTo: searchBar.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: searchBar.widthAnchor, constant: -32).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.searchTextField.becomeFirstResponder()
    }
    
    @objc private func didTapBackButton(){
        dismiss(animated: true, completion: nil)
    }
    
    private func setupTableView(){
        view.addSubview(resultsTableView)
        resultsTableView.translatesAutoresizingMaskIntoConstraints = false
        resultsTableView.register(AroundCurrentLocationTableViewCell.self, forCellReuseIdentifier: AroundCurrentLocationTableViewCell.identifier)
        
        let constraints = [
            resultsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
    }
}

extension SearchLocationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if results.isEmpty {
            return 1
        } else {
            return results.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = resultsTableView.dequeueReusableCell(withIdentifier: AroundCurrentLocationTableViewCell.identifier, for: indexPath) as? AroundCurrentLocationTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        resultsTableView.deselectRow(at: indexPath, animated: true)
    }
}
