//
//  MyClass.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/05.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit

class MyClass: NSObject, NSCoding {

    var date: Date = Date()
    
    required init?(coder aDecoder: NSCoder) {
        date = aDecoder.decodeObject(forKey: "date") as! Date
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: "date")
    }


}
