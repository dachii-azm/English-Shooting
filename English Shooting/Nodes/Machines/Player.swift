//
//  Player.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/21.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import CoreGraphics

class Player: Machine {
    
    let engineBurstEmitter = SKEmitterNode(fileNamed: "PlayerEngine")!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    convenience init() {
        let size = CGSize(width: 42, height: 99)
        self.init(texture: SKTexture(imageNamed: ImageName.Player.rawValue),
                  color: UIColor.brown,
                  size: size)
        //???????????????
       // name = NSStringFromClass(Player.self)
        self.name = "Player"
        
        configureEngineBurst()
    }
    
    //set PlayerEngin as Following Player Machine
    func configureEngineBurst() {
        self.engineBurstEmitter.position = CGPoint(x: 0, y: -28)
        self.engineBurstEmitter.zPosition = -10
        self.addChild(engineBurstEmitter)
    }
    
    //Identify Physics Setting
    func configureCollisions() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody!.usesPreciseCollisionDetection = true
        physicsBody!.allowsRotation = false
        
        physicsBody!.categoryBitMask = CategoryBitmask.player.rawValue
        physicsBody!.collisionBitMask =
            CategoryBitmask.enemyMissile.rawValue |
            CategoryBitmask.screenBounds.rawValue
        
        physicsBody!.contactTestBitMask =
            CategoryBitmask.enemy.rawValue |
            CategoryBitmask.enemyMissile.rawValue
    }
    
    //player launch missile straightly 
    @objc func launchMissile() {
        // Create a missile
        let missile = Missile.playerMissile()
        missile.position = CGPoint(x: self.position.x, y: frame.maxY)
        missile.zPosition = zPosition - 1
        
        // Place it in the scene
        scene!.addChild(missile)
        
        // Make it move
        let velocity: CGFloat = 600.0
        let moveDuration = scene!.size.height / velocity
        let missileEndPosition = CGPoint(x: position.x, y: position.y + scene!.size.height * 2)
        
        let moveAction = SKAction.move(to: missileEndPosition, duration: TimeInterval(moveDuration))
        let removeAction = SKAction.removeFromParent()
        let sequenceAction = SKAction.sequence([moveAction, removeAction])
        //missile.run(moveAction)
        missile.run(sequenceAction)
        // Play sound
        //scene!.run(SKAction.playSoundFileNamed(SoundName.MissileLaunch.rawValue, waitForCompletion: false))
    }
}

