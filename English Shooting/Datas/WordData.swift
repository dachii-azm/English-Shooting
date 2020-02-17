//
//  WordData.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/05.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit


struct WordList {
    
    static let WordEasy: [String] = ["dog", "cat", "pig", "red", "item", "January", "Febrary", "March", "Aplil", "May", "June", "Juay", "August", "September", "Octorber", "November", "December", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", ""]
    
    static let WordNormal: [String] = []
    
    static let WordHard: [String] = []
    
   // static let WordExtremely: [String] = []
    
    static let WordList = WordEasy + WordNormal + WordHard
    
    //MARK DEBUG
    
    //if dictionary doesn't have the word, present it
    func findMissWords() {
        
        
    }
    
    // if same words put into the WordList, present it and arrange WordList alphabetically
    func arrangeTheWords() {
        
    }
}
