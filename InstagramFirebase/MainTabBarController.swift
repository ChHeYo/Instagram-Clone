//
//  MainTabBarController.swift
//  InstagramFirebase
//
//  Created by Jason Yoo on 12/12/17.
//  Copyright © 2017 ThumbsUp. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)
        let navigationController = UINavigationController(rootViewController: userProfileController)
        
        navigationController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        navigationController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        
        tabBar.tintColor = .black
        
        // order matters
        viewControllers = [navigationController, UIViewController()]
        
    }
}
