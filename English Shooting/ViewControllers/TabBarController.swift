//
//  MainTabBarController.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/28.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    var VCList = [UIViewController]()
    private let firstVC = GameTableViewController()
    private let secondVC = MainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.black
        appendVCtoVCList()
        configureNav()
    }
    
    //add ViewControllers to VCList and paste TabBar to them
    func appendVCtoVCList() {
        firstVC.tabBarItem = UITabBarItem(title: "GAME", image: UIImage(named: "GameTabIcon"), tag: 0)
        VCList.append(firstVC)
        
        //secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
        secondVC.tabBarItem = UITabBarItem(title: "SET", image: UIImage(named: "MainTabIcon"), tag: 1)
        VCList.append(secondVC)
    }
    
    
   func configureNav() {
        self.VCList = VCList.map{ CustomNavigationController(rootViewController: $0)}
        self.setViewControllers(VCList, animated: true)
    }
}
