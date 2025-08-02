//
//  MainTabController.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 27.07.2025.
//

import UIKit

final class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension MainTabController {
    
    fileprivate func configure() {
        self.view.backgroundColor = UIColor.background
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.background
        
        changeColor(itemAppearance: appearance.stackedLayoutAppearance)
        changeColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance
        
        let homeDataProvider = HomeDataProvider()
        let homeViewController = HomeViewController()
        homeViewController.viewModel = HomeViewModel(service: homeDataProvider)
        
        let discoverViewController = ExploreViewController()
        let favoritesViewController = FavoritesViewController()
        let profileViewController = ProfileViewController()
        let nc1 = configureViewController(title: "Home", img: UIImage(named: "home")!, vc: homeViewController)
        let nc2 = configureViewController(title: "Discover", img: UIImage(systemName: "globe")!, vc: discoverViewController)
        let nc3 = configureViewController(title: "Favorites", img: UIImage(systemName: "heart")!, vc: favoritesViewController)
        let nc4 = configureViewController(title: "Profile", img: UIImage(systemName: "person.crop.circle")!, vc: profileViewController)
        viewControllers = [nc1, nc2, nc3, nc4]
    }
    
    private func changeColor(itemAppearance:UITabBarItemAppearance) {
        // isSelected
        itemAppearance.selected.iconColor = UIColor.blue
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange,.font: UIFont.Readex(.medium, size: 13)]
        itemAppearance.selected.badgeBackgroundColor = UIColor.systemMint
        // non selected
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white,.font: UIFont.Readex(.medium, size: 13)]
        itemAppearance.normal.badgeBackgroundColor = UIColor.lightGray
    }
    
    fileprivate func configureViewController(title: String?, img: UIImage,selectedImg: UIImage? = nil,vc: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem.title = title ?? ""
        navigationController.tabBarItem.image = img
        navigationController.tabBarItem.image?.withTintColor(.primaryColor)
        navigationController.tabBarItem.selectedImage = selectedImg
        navigationController.tabBarItem.selectedImage?.withTintColor(.primaryColor)
        return navigationController
    }
}
