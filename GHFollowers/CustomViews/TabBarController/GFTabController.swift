//
//  GFTabController.swift
//  GHFollowers
//
//  Created by Felix Alexander Sotelo Quezada on 23-03-21.
//

import UIKit

class GFTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemRed
        viewControllers = [createSearchNavController(), createFavoriteNavController()]


    }
    

    

}

//MARK: Func for navControllers
private extension GFTabController {
    func createSearchNavController() -> UINavigationController {
        let searchVC = SearchViewController()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
        
    }
    func createFavoriteNavController() -> UINavigationController {
        let favListVC = FavoritesListViewController()
        favListVC.title = "Favorites"
        favListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favListVC)
    }
    
}
