//
//  ContextOfCells.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/01.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit

struct ShopCells {
    
    var title: String?
    var ability: String?
}

struct ChooseGameLevelCells {
    var title: String?
    var complete: String?
    
}

struct UserCells {
    
    var title:String?
    var money: Int?
}

struct ShopDetaileCells {
    
    var type: String?
    var title:String?
    var ability: String?
    var money: Int?
    var level: Int?
    //var isObtained: Bool? = false
}

struct ContextOfAmmo {
    
    var type: String?
    var title: String?
    var power: Int?
    var rate: CGFloat?
    var size: CGFloat?
    var number: Int?
    var isTracking: Bool?
    var HP: Int?
    var money: Int?
    var level: Int?
    var device: [String]?
}

struct ContextOfDevice {
    
    var type: String?
    var title: String?
    var HP: Int?
    var size: CGFloat?
    var number: Int?
    var shield: Int?
    var money: Int?
    var level: Int?
}

struct ContextOfSkill {
    
    var type: String
    var title: String
    var ability: Int
}
