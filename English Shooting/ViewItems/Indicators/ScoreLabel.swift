//
//  ScoreLabel.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/26.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class ScoreLabel: SKLabelNode {
    
    var value: Int = 0 {
        didSet{
            update()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        fontSize = 30
        fontColor = UIColor.white
        fontName = "AppleSDGothicNeo-Bold"
        horizontalAlignmentMode = .left
        update()
    }
    
    func update() {
        text = "<\(value)"
    }
    
    
    
    
}
