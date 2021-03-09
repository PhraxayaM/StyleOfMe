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
            let weatherNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "Activity copy"), selectedImage: #imageLiteral(resourceName: "Activity copy"), rootViewController: WeatherVC())
            weatherNavController.title = "Weather"
            
            //ToDo
            let journalNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "Paper copy"), selectedImage: #imageLiteral(resourceName: "Paper copy"), rootViewController: JournalList(collectionViewLayout: createLayout()))
            let toDoNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "drop"), selectedImage: #imageLiteral(resourceName: "drop"), rootViewController: ToDoList())
            toDoNavController.title = "To Do"
//            journalNavController.navigationBar.prefersLargeTitles = true
            tabBar.tintColor = .black
            
            let journalList = templateNavController(unselectedImage: #imageLiteral(resourceName: "book"), selectedImage: #imageLiteral(resourceName: "hopeful"), rootViewController: JournalListVC())
            journalList.title = "Journal"
            
            journalList.navigationItem.largeTitleDisplayMode = .always
            journalList.navigationBar.prefersLargeTitles = true
            viewControllers = [homeNavController, weatherNavController, toDoNavController,journalList]
        
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
    

    private func createLayout() -> UICollectionViewLayout {
    //1
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .fractionalHeight(1.0))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
    //2
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(120))
    //3
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,subitems: [item])
        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180)), subitem: item, count: 2)
        group2.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
    let section = NSCollectionLayoutSection(group: group2)
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
    }
        
    }
