//
//  Detas.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/04.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit

struct Device {
    
    static let device: [String] = ["fountain pen", "pencil", "paint brush", "creyon", "marker"]
    static let deviceList: [[ContextOfDevice]] = [Device.fountainPen,Device.pencil,Device.paintBrush,Device.creyon,Device.marker]
    
    static let fountainPen: [ContextOfDevice] = [
        ContextOfDevice(type: "Device", title: "fountain pen", HP: 1, size: 1, number: 1, shield: 0, money: 500, level: 1),
        ContextOfDevice(type: "Device", title: "fountain pen", HP: 2, size: 1, number: 1, shield: 0, money: 500, level: 2),
        ContextOfDevice(type: "Device", title: "fountain pen", HP: 3, size: 1, number: 1, shield: 0, money: 500, level: 3),
        ContextOfDevice(type: "Device", title: "fountain pen", HP: 5, size: 1, number: 1, shield: 0, money: 500, level: 4),
        ContextOfDevice(type: "Device", title: "fountain pen", HP: 7, size: 1, number: 1, shield: 0, money: 500, level: 5),
        ContextOfDevice(type: "Device", title: "fountain pen", HP: 8, size: 1, number: 1, shield: 0, money: 500, level: 6),
        ContextOfDevice(type: "Device", title: "fountain pen", HP: 10, size: 1, number: 1, shield: 0, money: 500, level: 7),
    ]
    
    static let pencil: [ContextOfDevice] = [
        ContextOfDevice(type: "Device", title: "pencil", HP: 1, size: 1, number: 1, shield: 0, money: 500, level: 1),
        ContextOfDevice(type: "Device", title: "pencil", HP: 2, size: 1, number: 1, shield: 0, money: 500, level: 2),
        ContextOfDevice(type: "Device", title: "pencil", HP: 3, size: 0.9, number: 1, shield: 0, money: 500, level: 3),
        ContextOfDevice(type: "Device", title: "pencil", HP: 3, size: 0.86, number: 1, shield: 0, money: 500, level: 4),
        ContextOfDevice(type: "Device", title: "pencil", HP: 4, size: 0.8, number: 1, shield: 0, money: 500, level: 5),
        ContextOfDevice(type: "Device", title: "pencil", HP: 5, size: 0.75, number: 1, shield: 0, money: 500, level: 6),
        ContextOfDevice(type: "Device", title: "pencil", HP: 6, size: 0.7, number: 1, shield: 0, money: 500, level: 7),
    ]
    
    static let paintBrush: [ContextOfDevice] = [
        ContextOfDevice(type: "Device", title: "paint brush", HP: 3, size: 1, number: 1, shield: 0, money: 500, level: 1),
        ContextOfDevice(type: "Device", title: "paint brush", HP: 4, size: 1, number: 1, shield: 0, money: 500, level: 2),
        ContextOfDevice(type: "Device", title: "paint brush", HP: 6, size: 1, number: 1, shield: 0, money: 500, level: 3),
        ContextOfDevice(type: "Device", title: "paint brush", HP: 7, size: 1, number: 1, shield: 0, money: 500, level: 4),
        ContextOfDevice(type: "Device", title: "paint brush", HP: 10, size: 1, number: 1, shield: 0, money: 500, level: 5),
        ContextOfDevice(type: "Device", title: "paint brush", HP: 12, size: 1, number: 1, shield: 0, money: 500, level: 6),
        ContextOfDevice(type: "Device", title: "paint brush", HP: 15, size: 1, number: 1, shield: 0, money: 500, level: 7),
    ]
    
    static let creyon: [ContextOfDevice] = [
        ContextOfDevice(type: "Device", title: "creyon", HP: 1, size: 1, number: 1, shield: 0, money: 500, level: 1),
        ContextOfDevice(type: "Device", title: "creyon", HP: 2, size: 1, number: 1, shield: 0, money: 500, level: 2),
        ContextOfDevice(type: "Device", title: "creyon", HP: 3, size: 0.9, number: 1, shield: 0, money: 500, level: 3),
        ContextOfDevice(type: "Device", title: "creyon", HP: 4, size: 0.9, number: 2, shield: 0, money: 500, level: 4),
        ContextOfDevice(type: "Device", title: "creyon", HP: 5, size: 0.85, number: 2, shield: 0, money: 500, level: 5),
        ContextOfDevice(type: "Device", title: "creyon", HP: 6, size: 0.85, number: 2, shield: 0, money: 500, level: 6),
        ContextOfDevice(type: "Device", title: "creyon", HP: 7, size: 0.8, number: 3, shield: 0, money: 500, level: 7),
    ]
    
    static let marker: [ContextOfDevice] = [
        ContextOfDevice(type: "Device", title: "marker", HP: 1, size: 1, number: 1, shield: 0, money: 500, level: 1),
        ContextOfDevice(type: "Device", title: "marker", HP: 1, size: 1, number: 1, shield: 0, money: 500, level: 2),
        ContextOfDevice(type: "Device", title: "marker", HP: 2, size: 1, number: 1, shield: 0, money: 500, level: 3),
        ContextOfDevice(type: "Device", title: "marker", HP: 3, size: 1, number: 1, shield: 0, money: 500, level: 4),
        ContextOfDevice(type: "Device", title: "marker", HP: 3, size: 1, number: 1, shield: 0, money: 500, level: 5),
        ContextOfDevice(type: "Device", title: "marker", HP: 4, size: 1, number: 1, shield: 0, money: 500, level: 6),
        ContextOfDevice(type: "Device", title: "marker", HP: 5, size: 1, number: 1, shield: 0, money: 500, level: 7),
    ]
}

struct Ammo {
    
    static let ammo: [String] = ["comma", "alphabet", "paint", "laser", "missile"]
    static let ammoList: [[ContextOfAmmo]] = [Ammo.comma, Ammo.alphabet, Ammo.paint, Ammo.laser,Ammo.missile]
    
    static let comma: [ContextOfAmmo] = [
        ContextOfAmmo(type: "Ammo", title: "comma", power: 1, rate:1.0, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 1 ,device: ["fountain pen", "pencil", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "comma", power: 1, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 2,device: ["fountain pen", "pencil", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "comma", power: 1, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 3,device: ["fountain pen", "pencil", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "comma", power: 1, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 4,device: ["fountain pen", "pencil", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "comma", power: 1, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 5,device: ["fountain pen", "pencil", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "comma", power: 1, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 6,device: ["fountain pen", "pencil", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "comma", power: 1, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 7,device: ["fountain pen", "pencil", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "comma", power: 1, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 8,device: ["fountain pen", "pencil", "creyon"])
    ]
    
   
    static let alphabet: [ContextOfAmmo] = [
        ContextOfAmmo(type: "Ammo", title: "alphabet", power: 5, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 1,device: ["fountain pen", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "alphabet", power: 5, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 2,device: ["fountain pen", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "alphabet", power: 5, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 3,device: ["fountain pen", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "alphabet", power: 5, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 4,device: ["fountain pen", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "alphabet", power: 5, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 5,device: ["fountain pen", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "alphabet", power: 5, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 6,device: ["fountain pen", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "alphabet", power: 5, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 7,device: ["fountain pen", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "alphabet", power: 5, rate:1, size: 1, number: 1, isTracking: false, HP: 1, money: 500, level: 8,device: ["fountain pen", "creyon"])
    ]

    static let paint: [ContextOfAmmo] = [
        ContextOfAmmo(type: "Ammo", title: "paint", power: 50, rate:1.0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 1,device: ["paint brush", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "paint", power: 50, rate:1.0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 2,device: ["paint brush", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "paint", power: 50, rate:1.0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 3,device: ["paint brush", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "paint", power: 50, rate:1.0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 4,device: ["paint brush", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "paint", power: 50, rate:1.0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 5,device: ["paint brush", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "paint", power: 50, rate:1.0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 6,device: ["paint brush", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "paint", power: 50, rate:1.0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 7,device: ["paint brush", "creyon"]),
        ContextOfAmmo(type: "Ammo", title: "paint", power: 50, rate:1.0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 8,device: ["paint brush", "creyon"])
    ]
    
    static let laser: [ContextOfAmmo] = [
        ContextOfAmmo(type: "Ammo", title: "laser", power: 1, rate:0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 1,device: ["marker"]),
        ContextOfAmmo(type: "Ammo", title: "laser", power: 1, rate:0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 2,device: ["marker"]),
        ContextOfAmmo(type: "Ammo", title: "laser", power: 1, rate:0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 3,device: ["marker"]),
        ContextOfAmmo(type: "Ammo", title: "laser", power: 1, rate:0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 4,device: ["marker"]),
        ContextOfAmmo(type: "Ammo", title: "laser", power: 1, rate:0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 5,device: ["marker"]),
        ContextOfAmmo(type: "Ammo", title: "laser", power: 1, rate:0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 6,device: ["marker"]),
        ContextOfAmmo(type: "Ammo", title: "laser", power: 1, rate:0, size: 1.0, number: 1, isTracking: false, HP: 1, money: 500, level: 7,device: ["marker"])
    ]
    
    static let missile: [ContextOfAmmo] = [
        ContextOfAmmo(type: "Ammo", title: "missile", power: 1, rate:1, size: 1.0, number: 1, isTracking: true, HP: 1, money: 500, level: 1,device: ["pencil"]),
        ContextOfAmmo(type: "Ammo", title: "missile", power: 1, rate:1, size: 1.0, number: 1, isTracking: true, HP: 1, money: 500, level: 2,device: ["pencil"]),
        ContextOfAmmo(type: "Ammo", title: "missile", power: 1, rate:1, size: 1.0, number: 1, isTracking: true, HP: 1, money: 500, level: 3,device: ["pencil"]),
        ContextOfAmmo(type: "Ammo", title: "missile", power: 1, rate:1, size: 1.0, number: 1, isTracking: true, HP: 1, money: 500, level: 4,device: ["pencil"]),
        ContextOfAmmo(type: "Ammo", title: "missile", power: 1, rate:1, size: 1.0, number: 1, isTracking: true, HP: 1, money: 500, level: 5,device: ["pencil"]),
        ContextOfAmmo(type: "Ammo", title: "missile", power: 1, rate:1, size: 1.0, number: 1, isTracking: true, HP: 1, money: 500, level: 6,device: ["pencil"]),
        ContextOfAmmo(type: "Ammo", title: "missile", power: 1, rate:1, size: 1.0, number: 1, isTracking: true, HP: 1, money: 500, level: 7,device: ["pencil"])
    ]
}

struct Main {
    
    static let sectionList: [String] = ["User", "Equipment", "Shop"]
    
    static let user: [UserCells] = [UserCells(title: "Title", money: 0)]
    
    static let shop: [ShopCells] = [
        ShopCells(title: "Device", ability: "Health"),
        ShopCells(title: "Ammo", ability: "Power"),
        ShopCells(title: "Skill", ability: "Skill"),
        ]
    

}

struct Game {
    
    static let GameLevel: [ChooseGameLevelCells] = [
        ChooseGameLevelCells(title: "GameLevel: Easy" , complete: "10%"),
        ChooseGameLevelCells(title: "GameLevel: Normal", complete: "50%"),
        ChooseGameLevelCells(title: "GameLevel: Hard", complete: "0%"),
        ChooseGameLevelCells(title: "GameLevel: Extra Hard", complete: "0%")
    ]
}

