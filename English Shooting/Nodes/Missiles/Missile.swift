//
//  Missile.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/22.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Missile: SKSpriteNode {
    
    //this cord is need to create new own class
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let size = CGSize(width: 6.0, height: 10.0)
        
        self.init(texture: SKTexture(imageNamed:ImageName.Missile.rawValue),
                  color: UIColor.brown,
                  size: size)
        
        name = NSStringFromClass(Missile.self)
        
        // Configure physics body
        //I don't know what "rectangleOf" says and "self.size" is corrected
        physicsBody = SKPhysicsBody(rectangleOf: self.size)
        physicsBody!.usesPreciseCollisionDetection = true
    }
    
    class func playerMissile() -> Missile {
        let missile = Missile()
        missile.physicsBody!.categoryBitMask = CategoryBitmask.playerMissile.rawValue
        missile.physicsBody!.contactTestBitMask = CategoryBitmask.enemy.rawValue
        return missile
    }
    
    class func enemyMissile() -> Missile {
        let missile = Missile()
        missile.physicsBody!.categoryBitMask = CategoryBitmask.enemyMissile.rawValue
        missile.physicsBody!.contactTestBitMask = CategoryBitmask.player.rawValue
        return missile
    }
    
    
    
}
