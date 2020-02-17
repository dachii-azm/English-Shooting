//
//  NavigationLTMLabel.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/02.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit
import LTMorphingLabel

class NavigationLTMLabel: LTMorphingLabel {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        self.textColor = UIColor.white
        self.morphingEffect = .scale
        
    }
}
