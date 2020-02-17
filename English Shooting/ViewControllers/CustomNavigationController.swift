//
//  CustomNavigationController.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/08.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationController: UINavigationController {
   
    var navLabel: NavigationLTMLabel!
    private var navTitle:[String] = ["Today", "is Monday", "Main menu"]
    //Timer to controll LTMLabel
    private var navTimer: Timer?
    //Index to update LTMLabel
    private var navIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        LTMTimer()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.view.layer.removeAllAnimations()
        if(animated) {
            let transition: CATransition = CATransition()
            transition.duration = 0.25
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromRight
            self.view.layer.add(transition,forKey:kCATransition)
        }
        return super.pushViewController(viewController, animated: false)
    }
}
    
//MARK Configure
extension CustomNavigationController {
    
    //Configure UINavigationBar
    private func configureNavBar() {
        let navBar = self.navigationBar
        navBar.barTintColor = UIColor.black
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 20)!]
        navBar.isTranslucent = true
    }
    
    
    private func configureNavTitle() {
        let navWidth = (self.navigationBar.frame.size.width)
        let navHeight = (self.navigationBar.frame.size.height)
        navLabel = NavigationLTMLabel(frame: CGRect(x: navWidth/2 - navWidth/4 , y: 0, width: navWidth/2 , height: navHeight))
        navLabel.textAlignment = .center
        self.navigationBar.addSubview(navLabel)
    }
    
    //configure all system
    private func configure() {
        configureNavBar()
        configureNavTitle()
    }
}

//MARK Animation
extension CustomNavigationController {
   
    private func LTMTimer() {
        navLabel.text = navTitle[navIndex]
        self.navTimer = Timer.scheduledTimer(timeInterval: 1.5,
                                             target: self,
                                             selector: #selector(update(timer:)), userInfo: nil,
                                             repeats: true)
        
    }
    
    @objc func update(timer: Timer) {
        navLabel.text = navTitle[navIndex]
        
        navIndex += 1
        if navIndex >= navTitle.count {
            navIndex = 0
        }
    }
}
