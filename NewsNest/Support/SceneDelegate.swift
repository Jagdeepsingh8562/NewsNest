//
//  SceneDelegate.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 11/06/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
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
    
    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        UITabBar.appearance().tintColor = .systemBlue
        tabBar.viewControllers = [createTopHeadlinesNC(), createSearchNC(), createCategoryNC()]
        return tabBar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

