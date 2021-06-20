//
//  NewsTabBarController.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 20/06/21.
//

import UIKit

class NewsTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemBlue
        viewControllers = [createTopHeadlinesNC(), createSearchNC(), createCategoryNC()]
        // Do any additional setup after loading the view.
    }
    func createTopHeadlinesNC() -> UINavigationController {
        let topHeadlinesVC = TopHeadlinesVC()
        topHeadlinesVC.title = "Top Headlines"
        topHeadlinesVC.tabBarItem = UITabBarItem(title: "Top Headlines", image: UIImage(systemName: "newspaper"),tag: 0)
        UINavigationBar.appearance().prefersLargeTitles = true
        return UINavigationController(rootViewController: topHeadlinesVC)
    }
    
    func createSearchNC() -> UINavigationController {
        let searchVC = NewsSearchVC()
        searchVC.title = "News Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createCategoryNC() -> UINavigationController {
        let categoryVC = NewsCategoryVC()
        categoryVC.title = "News by Category"
        categoryVC.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "tag"),tag: 2)
        let categoryNC = UINavigationController(rootViewController: categoryVC)
        categoryNC.navigationBar.prefersLargeTitles = false
        return categoryNC
    }

}
