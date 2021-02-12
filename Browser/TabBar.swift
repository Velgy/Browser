//
//  TabBar.swift
//  Browser
//
//  Created by Валентин Панин on 11.02.2021.
//

import UIKit

class DashboardTabBarController: UITabBarController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchVC = SearchViewController()
        let icon1 = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "icons8-search-client-50-2") , selectedImage: #imageLiteral(resourceName: "icons8-search-client-50-2"))
        
        let itemNavigationContoller = UINavigationController(rootViewController: searchVC)
        itemNavigationContoller.tabBarItem = icon1
        
        let historyVC = HistoryViewController()
        let icon2 = UITabBarItem(title: "History", image: #imageLiteral(resourceName: "icons8-books-100-2") , selectedImage: #imageLiteral(resourceName: "icons8-books-100-2"))
        icon2.badgeColor = .black
        let itemNavigationContoller2 = UINavigationController(rootViewController: historyVC)
        itemNavigationContoller2.tabBarItem = icon2
        
        self.viewControllers = [itemNavigationContoller, itemNavigationContoller2]
        
        
        
        
    }
}
