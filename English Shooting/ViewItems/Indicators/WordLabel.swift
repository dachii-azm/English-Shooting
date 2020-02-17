//
//  WordLabel.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/26.
//  Copyright © 2019 dachii. All rights reserved.
//


import Foundation
import UIKit
import SpriteKit

class WordLabel: SKLabelNode {
    
    var word: String = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        fontSize = 30
        fontColor = UIColor.white
        fontName = "AppleSDGothicNeo-Bold"
        horizontalAlignmentMode = .center
        name = "wordLabel"
        zPosition = 200
        position = CGPoint(x: 0, y: 0)
        text = ""
    }
    
    func openDictionary() {
        let word = self.text
        let currentViewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController!
        let ref: UIReferenceLibraryViewController = UIReferenceLibraryViewController(term: word!)
        currentViewController!.present(ref, animated: false, completion: nil)
    }
    
    func chooseWord() {
        let wordList: [String] = UserDefaults.standard.array(forKey: UsData.settingWordList) as! [String]
        let index = Int(arc4random_uniform(UInt32(wordList.count)))
        let word = wordList[index]
        self.text = word
    }
}
