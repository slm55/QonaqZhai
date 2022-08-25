//
//  SearchLocationViewController.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 14.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

class SearchLocationViewController: UIViewController {
    private let searchBar = UISearchBar()
    
    private let resultsTableView = UITableView()
    
    private let locations: BehaviorRelay<[Location]> = BehaviorRelay(value: [])
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(searchBar)
        setupSearchBar()
        setupTableView()
        
        let cell = AroundCurrentLocationTableViewCell()
        cell.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cell)
        cell.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        cell.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        cell.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cell.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        searchBar.rx.text.orEmpty
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: {
                [weak self]
                value in
                if value == "" {
                    cell.isHidden = false
                    self?.resultsTableView.isHidden = true
                } else {
                    cell.isHidden = true
                    self?.resultsTableView.isHidden = false
                }
                
                APICaller.shared.searchLocation(query: value) {
                    [weak self] result in
                    switch result{
                    case .success(let locations):
                        self?.locations.accept(locations)
                    case .failure(_):
                        self?.locations.accept([])
                    }
                }
            }).disposed(by: bag)
        
        locations.bind(to: resultsTableView.rx.items(cellIdentifier: SearchLocationTableViewCell.identifier)) {
            row, model, cell in
            (cell as! SearchLocationTableViewCell).configure(with: SearchLocationTableViewCellViewModel(iconURL: model.imageURL, locationRegion: model.name, locationCity: model.cityName, locationName: model.region, locationCountry: model.country, locationProperties: model.nrHotels))
        }.disposed(by: bag)
        
        
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
        resultsTableView.register(SearchLocationTableViewCell.self, forCellReuseIdentifier: SearchLocationTableViewCell.identifier)
        resultsTableView.rowHeight = 88
        
        let constraints = [
            resultsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

