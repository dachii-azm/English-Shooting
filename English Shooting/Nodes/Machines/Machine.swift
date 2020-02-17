//
//  machine.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/21.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Machine: SKSpriteNode, LifePointsProtocol {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    var didRunOutOfLifePointsEventHandler: DidRunOutOfLifePointsEventHandler? = nil
    
    var lifePoints: Int = 0 {
        didSet {
            if lifePoints <= 0 {
                didRunOutOfLifePointsEventHandler?(self)
            }
        }
    }
}
