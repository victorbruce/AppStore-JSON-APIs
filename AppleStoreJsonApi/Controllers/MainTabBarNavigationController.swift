//
//  MainTabBarNavigationController.swift
//  AppleStoreJsonApi
//
//  Created by Victor Bruce on 03/07/2023.
//

import UIKit

class MainTabBarNavigationController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchVC = createNavController(viewController: SearchViewController(), title: "Search", imageName: "magnifyingglass")
    
        tabBar.tintColor = .label
        viewControllers = [searchVC]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        return navController
    }
}
