//
//  TabBarViewController.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 12.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = SearchViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        let vc4 = UIViewController()
        
        vc1.title = "QonaqZhai"
        vc2.title = "Saved"
        vc3.title = "Bookings"
        
        vc1.navigationItem.largeTitleDisplayMode = .never
        vc2.navigationItem.largeTitleDisplayMode = .never
        vc3.navigationItem.largeTitleDisplayMode = .never
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
        nav3.navigationBar.tintColor = .label
        nav4.navigationBar.tintColor = .label
        
        nav1.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "heart"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Bookings", image: UIImage(systemName: "suitcase"), tag: 1)
        nav4.tabBarItem = UITabBarItem(title: "Sign in", image: UIImage(systemName: "person.circle"), tag: 1)
        
        nav1.navigationBar.prefersLargeTitles = false
        nav2.navigationBar.prefersLargeTitles = false
        nav3.navigationBar.prefersLargeTitles = false
        nav4.navigationBar.prefersLargeTitles = false
        
        tabBar.tintColor = .systemBlue
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: true)
    }

}
