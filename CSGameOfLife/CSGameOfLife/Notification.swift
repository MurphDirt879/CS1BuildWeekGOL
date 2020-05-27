//
//  Notification.swift
//  CSGameOfLife
//
//  Created by Ryan Murphy on 5/27/20.
//  Copyright © 2020 Ryan Murphy. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let didChangeCellColor = Notification.Name("didChangeCellColor")
    static let generationChanged = Notification.Name("generationChanged")
    static let gameReset = Notification.Name("gameReset")
}
