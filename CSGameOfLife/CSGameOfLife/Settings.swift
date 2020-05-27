//
//  Settings.swift
//  CSGameOfLife
//
//  Created by Ryan Murphy on 5/27/20.
//  Copyright © 2020 Ryan Murphy. All rights reserved.
//

import UIKit

enum CellColor: Int {
    case green = 1
    case blue
    case red
    case black
}

class Settings{

    static let shared = Settings()
    var cellColor: CellColor = .black {
        didSet{
            NotificationCenter.default.post(name: .didChangeCellColor, object: nil)
        }
    }
    
}
