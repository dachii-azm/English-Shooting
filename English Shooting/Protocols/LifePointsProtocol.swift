//
//  LifePointsProtocol.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/21.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import SpriteKit

typealias DidRunOutOfLifePointsEventHandler = (_ object: AnyObject) -> ()

protocol LifePointsProtocol {
    var lifePoints: Int { get set }
    var didRunOutOfLifePointsEventHandler: DidRunOutOfLifePointsEventHandler? { get set }
}
