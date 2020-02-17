//
//  GameSceneNavigationBar.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/11.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit

class GameNavigationBar: UINavigationBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        var newSize = super.sizeThatFits(size)
        
        //iphoneX
        var topInset:CGFloat = 0
        if #available(iOS 11.0, *) {
            topInset = superview?.safeAreaInsets.top ?? 0
        }
        
        //How much you add height
        let addHeight:CGFloat = 30.0 + topInset
         newSize.height += addHeight
        
        return newSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //iOS11以上でのみ
        if #available(iOS 11.0, *) {
            for subview in self.subviews {
                let stringFromClass = NSStringFromClass(subview.classForCoder)
                if stringFromClass.contains("BarBackground") {
                    //ステータスバー分あげないと余白ができる。
                    let statusBarHeight = UIApplication.shared.statusBarFrame.height
                    let point = CGPoint(x:0,y:-statusBarHeight)
                    //ここでバーの高さを調節 (sizeThatFitsを呼び出す)
                    subview.frame = CGRect(origin: point, size: sizeThatFits(self.bounds.size))
                }
            }
        }
    }
    
    
}
