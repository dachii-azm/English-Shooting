//
//  MainGameScene.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/21.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


class MainGameScene: SKScene, SKPhysicsContactDelegate{
    
    var bar: SKSpriteNode!
    var firstTouch: CGPoint = CGPoint.zero
    var startPos: CGPoint = CGPoint.zero
    var launchTimer: Timer!
    var banner: SKSpriteNode!
    private let scoreLabel = ScoreLabel()
    private let wordLable = WordLabel()
    private var player = Player()
    

    
    //loaded before get scene
    override func sceneDidLoad() {
        super.sceneDidLoad()
        print("LOADED")
        //I don't know why this result is (1.0, 1.0)
       // print("Size Of MainGameScene Is \(self.size)" )
        
    }
    
    //loaded but I don't know when it is loaded
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        configure()
        self.startPos = CGPoint(x: self.player.position.x , y: self.player.position.y)
        self.wordLable.chooseWord()
    }
    
    //it is loaded when touches View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch: AnyObject = touches.first {
            // Get touch location on scene
            let location = touch.location(in: self)
            firstTouch = location
            //player.launchMissile()
            launchMissileWhileTapping()
            
            
        }
    }
    
    //it is loaded when touches are moved
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch: AnyObject = touches.first {
            // Get touch location on scene
            let location = touch.location(in: self)
            changePlayerPosition(location: location)
            playerInScene()
        }
    }
    
    //it is loaded when touches are ended
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch: AnyObject = touches.first {
            let location = touch.location(in: self)
            startPos = CGPoint(x: player.position.x, y: player.position.y)
            stopLaunchingMissile()
        }
    }
    
    //it is loaded each FPS time
    override func update(_ currentTime: TimeInterval) {
    }
}

// MARK: - Configuration
extension MainGameScene {
    
    //set Physics Info
    private func configurePhysics() {
        // Disable gravity
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        //physicsWorld.contactDelegate = self
        
        // Add boundaries
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody!.categoryBitMask = CategoryBitmask.screenBounds.rawValue
        physicsBody!.collisionBitMask = CategoryBitmask.player.rawValue
    }
    
    //set Player Info
    private func configurePlayer() {
        // Position
        player.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2 )
        player.zPosition = 1.0
        // Life points
        player.lifePoints = 100
       // player.didRunOutOfLifePointsEventHandler = playerDidRunOutOfLifePointsEventHandler()
        // Add it to the scene
        self.addChild(player)
    }
    
    //change Player Position when touches are moved
    private func changePlayerPosition(location: CGPoint) {
        let distance: CGPoint = CGPoint(x: location.x - firstTouch.x , y: location.y - firstTouch.y)
        let nextPosition: CGPoint = CGPoint(x: distance.x + startPos.x, y: distance.y + startPos.y)
        
        self.player.position = nextPosition
    }
    
    //launch missile while tapping
    private func launchMissileWhileTapping() {
        self.launchTimer = Timer.scheduledTimer(timeInterval: 0.3, target: player, selector: #selector(self.player.launchMissile), userInfo: nil, repeats: true)
    }
    
    //stop missile when touches is canceled
    private func stopLaunchingMissile() {
        if self.launchTimer.isValid {
            self.launchTimer.invalidate()
        }
    }
    
    //set backGround1 To background
    private func configureBackGroundView() {
        let backGround = SKSpriteNode(imageNamed: ImageName.backGround.rawValue)
        backGround.size = CGSize(width: self.size.width, height: self.size.height)
        backGround.position = CGPoint(x: self.size.width / 2, y: backGround.size.height / 2)
        backGround.zPosition = -1000
        self.addChild(backGround)
    }
    
    private func configureBar() {
        self.bar = SKSpriteNode()
        bar.color = UIColor.black
        bar.size = CGSize(width: self.size.width, height: SizeSetting.GameBarHight.rawValue)
        bar.position = CGPoint(x: self.size.width/2, y: self.size.height - SizeSetting.GameBarHight.rawValue/2)
        bar.zPosition = 100
        self.addChild(bar)
    }
    
    private func configureScoreLabel() {
        self.scoreLabel.position = CGPoint(x: -self.size.width/2 + 10 , y: -20)
        
    }
    
    private func configureWordLabel() {
        self.bar.addChild(self.wordLable)
    }
    
    private func configure() {
        configurePhysics()
        configurePlayer()
        configureBackGroundView()
        configureBar()
       // configureScoreLabel()
        configureWordLabel()
    }
    
}

//MARK about Player
extension MainGameScene {
    
    //prevent player from being out of scene
    func playerInScene() {
        let barHeight = self.bar.size.height
        if self.player.frame.minX < 0 {
            self.player.position.x = self.player.size.width/2
        } else if self.player.frame.maxX > self.size.width {
            self.player.position.x = self.size.width - self.player.size.width/2
        }
        
        if self.player.frame.minY < 0 {
            self.player.position.y = self.player.size.height/2
        } else if self.player.frame.maxY > self.size.height - barHeight {
            self.player.position.y = self.size.height - barHeight - self.player.size.height/2
        }
        
    }
    
}
