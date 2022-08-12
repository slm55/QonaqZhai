//
//  ViewController.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 11.08.2022.
//

import UIKit


class SearchViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let mainContentContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let searchDetailsView = SearchDetailsView()
    
    override func loadView() {
        super.loadView()
        setupScrollView()
        setupSearchDetailsView()
        setupDiscountsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    private func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(mainContentContainerView)
        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainContentContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainContentContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainContentContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainContentContainerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        let widthConstraint = NSLayoutConstraint(item: mainContentContainerView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        widthConstraint.isActive = true
        
        let heightConstraint = NSLayoutConstraint(item: mainContentContainerView, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 1.0, constant: 0)
        heightConstraint.isActive = true
        heightConstraint.priority = .defaultLow
        
    }
    
    private func setupSearchDetailsView(){
        searchDetailsView.frame = CGRect(x: 16, y: 16, width: view.frame.width - 32, height: 264)
        mainContentContainerView.addSubview(searchDetailsView)
    }
    
    private func setupDiscountsView(){
        let discountsView = UIView()
        discountsView.translatesAutoresizingMaskIntoConstraints = false
        discountsView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        discountsView.layer.borderColor = UIColor.systemGray.cgColor
        discountsView.layer.borderWidth = 1
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        titleLabel.text = "Get instant discounts"
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .label
        stackView.addArrangedSubview(titleLabel)
        
        let textLabel = UILabel()
        textLabel.text = "Sign into Booking.com and look for the Genius logo to save"
        textLabel.font = .systemFont(ofSize: 16)
        textLabel.numberOfLines = 0
        textLabel.textColor = .label
        stackView.addArrangedSubview(textLabel)
        
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Sign in"
        configuration.baseBackgroundColor = .systemBlue
        configuration.baseForegroundColor = .white
        configuration.titlePadding = 16
        let button = UIButton(configuration: configuration, primaryAction: nil)
        stackView.addArrangedSubview(button)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "genius")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        discountsView.addSubview(stackView)
        discountsView.addSubview(imageView)
        
        mainContentContainerView.addSubview(discountsView)
        
        let constraints = [
            discountsView.topAnchor.constraint(equalTo: searchDetailsView.bottomAnchor, constant: 24),
            discountsView.leadingAnchor.constraint(equalTo: mainContentContainerView.leadingAnchor, constant: 16),
            discountsView.trailingAnchor.constraint(equalTo: mainContentContainerView.trailingAnchor, constant: -16),
            discountsView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: discountsView.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: discountsView.layoutMarginsGuide.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: discountsView.layoutMarginsGuide.widthAnchor, multiplier: 0.6),
            imageView.leadingAnchor.constraint(equalTo: stackView.trailingAnchor),
            imageView.trailingAnchor.constraint(equalTo: discountsView.layoutMarginsGuide.trailingAnchor),
            imageView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
}

