//
//  PhysicsSetting.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/22.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

enum CategoryBitmask: UInt32 {
    case player =           0
    case enemy =   0b10
    case playerMissile =    0b100
    case enemyMissile =     0b1000
    case screenBounds =     0b10000
}

