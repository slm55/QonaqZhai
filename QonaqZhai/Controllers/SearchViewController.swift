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
    
    override func loadView() {
        super.loadView()
        setupScrollView()
        setupSomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "QonaqZhai"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .label
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
        
        let widthConstraint = NSLayoutConstraint(item: mainContentContainerView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: -32)
        widthConstraint.isActive = true
        
        let heightConstraint = NSLayoutConstraint(item: mainContentContainerView, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 1.0, constant: 0)
        heightConstraint.isActive = true
        heightConstraint.priority = .defaultLow
        
    }
    
    private func setupSomeView(){
        let sv = SearchDetailsView()
        sv.frame = CGRect(x: 16, y: 16, width: view.frame.width - 32, height: 264)
        mainContentContainerView.addSubview(sv)
    }
    
}

