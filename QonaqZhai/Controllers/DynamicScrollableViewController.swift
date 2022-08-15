//
//  DynamicScrollableViewController.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 14.08.2022.
//

import UIKit

class DynamicScrollableViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    internal let mainContentContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var widthConstraint = NSLayoutConstraint()
    private var heightConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
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
        
        widthConstraint = NSLayoutConstraint(item: mainContentContainerView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        widthConstraint.isActive = true
        
        heightConstraint = NSLayoutConstraint(item: mainContentContainerView, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 1.0, constant: 0)
        heightConstraint.isActive = true
        heightConstraint.priority = .defaultLow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self is SearchViewController {
            
        } else {
            if mainContentContainerView.frame.height < view.safeAreaLayoutGuide.layoutFrame.height {
                scrollView.isHidden = true
                view.addSubview(mainContentContainerView)
                widthConstraint.isActive = false
                NSLayoutConstraint.activate([
                    mainContentContainerView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
                    mainContentContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    mainContentContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                ])
            }
        }
    }

}
