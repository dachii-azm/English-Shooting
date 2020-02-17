//
//  Enemy.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/26.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import SpriteKit

class EnemySpaceship: Machine {
    
    fileprivate var missileLaunchTimer: Timer?
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    init(lifePoints: Int, texture: SKTexture, size: CGSize) {
        //let size = CGSize(width: 36, height: 31)
        //super.init(texture: SKTexture(imageNamed: ImageName.EnemySpaceship.rawValue), color: UIColor.brown, size: size)
        super.init(texture: texture, color: UIColor.brown, size: size)
        
        self.lifePoints = lifePoints
        configureCollisions()
    }
    
    deinit {
        missileLaunchTimer?.invalidate()
    }
    
    // MARK: - Configuration
    
    fileprivate func configureCollisions() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody!.usesPreciseCollisionDetection = true
        physicsBody!.categoryBitMask = CategoryBitmask.enemy.rawValue
        physicsBody!.collisionBitMask =
            CategoryBitmask.enemy.rawValue |
            CategoryBitmask.playerMissile.rawValue |
            CategoryBitmask.player.rawValue
        
        physicsBody!.contactTestBitMask =
            CategoryBitmask.player.rawValue |
            CategoryBitmask.playerMissile.rawValue
    }
    
    // MARK: - Special actions
    
    func scheduleRandomMissileLaunch() {
        missileLaunchTimer?.invalidate()
        
        // Schedule missile launch with random delay
        let backoffTime = TimeInterval((arc4random() % 3) + 1)
        missileLaunchTimer = Timer(timeInterval: backoffTime, target: self, selector: #selector(EnemySpaceship.launchMissile), userInfo: nil, repeats: false)
    }
    
    @objc func launchMissile() {
        // Create a missile
        let missile = Missile.enemyMissile()
        missile.position = position
        missile.zPosition = zPosition - 1
        
        // Place it in the scene
        scene!.addChild(missile)
        
        // Make it move
        let velocity: CGFloat = 600.0
        let moveDuration = scene!.size.width / velocity
        let missileEndPosition = CGPoint(x: -0.1 * scene!.size.width, y: position.y)
        
        let moveAction = SKAction.move(to: missileEndPosition, duration: TimeInterval(moveDuration))
        let removeAction = SKAction.removeFromParent()
        missile.run(SKAction.sequence([moveAction, removeAction]))
        
        // Play sound
        //scene!.run(SKAction.playSoundFileNamed(SoundName.MissileLaunch.rawValue, waitForCompletion: false))
    }
    
}
