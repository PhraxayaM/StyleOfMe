//
//  MainTabBarVC.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/14/21.
//

import Foundation
import UIKit
class MainTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        
//        if index == 2 {
//            
//            let navController = UINavigationController(rootViewController: NewsViewController())
//            navController.modalPresentationStyle = .fullScreen
//            present(navController, animated: true, completion: nil)
//            return false
//        }
        
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        setupViewControllers()
    }
    
        func setupViewControllers() {
            //home
            
            let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "drop"), selectedImage: #imageLiteral(resourceName: "drop"), rootViewController: NewsViewController())

            
            //weather
            let searchNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "Activity copy"), selectedImage: #imageLiteral(resourceName: "Activity copy"), rootViewController: WeatherVC())
            
            //journal
            let journalNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "Paper copy"), selectedImage: #imageLiteral(resourceName: "Paper copy"), rootViewController: JournalList(collectionViewLayout: UICollectionViewFlowLayout()))
            
            tabBar.tintColor = .black
            
            
            viewControllers = [homeNavController, searchNavController, journalNavController]
        
            //change tab bar insets
            guard let items = tabBar.items else { return }
            
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
            }
        }
        
        fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
            let viewController = rootViewController
            let navController = UINavigationController(rootViewController: viewController)
            
            navController.tabBarItem.image = unselectedImage
            navController.tabBarItem.selectedImage = selectedImage
            
            return navController
        }
    
        
    }
