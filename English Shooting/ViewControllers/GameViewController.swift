//
//  ViewController.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/16.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var mainGameScene: MainGameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
        self.mainGameScene = MainGameScene()
        loadScene(scene: mainGameScene)
        configureButton()
        
    }

    //Set them in more detail later
    func setWtHt() -> (wt: CGFloat, ht: CGFloat) {
        let wt = self.view.bounds.width
        let ht = self.view.bounds.height
        
        return (wt, ht)
    }
    
    //load MainGameScene
    func loadScene(scene: SKScene) {
        let view = SKView()
        view.frame = self.view.frame
        self.view.addSubview(view)
        view.showsFPS = false
        view.showsNodeCount = true
        view.isExclusiveTouch = true
        scene.size = CGSize(width: setWtHt().wt , height: setWtHt().ht)
        scene.backgroundColor = UIColor.white
        view.presentScene(scene)
    }
    
    func configureButton() {
        let button = UIButton()
        button.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        button.setImage(UIImage(named: "Missile1"), for: .normal)
        button.addTarget(self, action: #selector(self.dismissVC(sender: )), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func dismissVC(sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}


//system About Navigation Label
extension GameViewController {
    
    
}
