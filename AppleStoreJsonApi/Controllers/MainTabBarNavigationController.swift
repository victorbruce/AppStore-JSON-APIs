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
        let appsVC = createNavController(viewController: AppsPageController(), title: "Apps", imageName: "square.stack.3d.up.fill")
    
        tabBar.tintColor = .systemBlue
        viewControllers = [appsVC, searchVC]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)

        return navController
    }
}
