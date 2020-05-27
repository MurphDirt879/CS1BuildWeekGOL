//
//  Cell.swift
//  CSGameOfLife
//
//  Created by Ryan Murphy on 5/27/20.
//  Copyright © 2020 Ryan Murphy. All rights reserved.
//

import UIKit



class Cell: UIView {
    var isAlive: Bool = false
    var color: UIColor{
        switch Settings.shared.cellColor {
            
        case .green:
            return .systemGreen
        case .blue:
            return .systemBlue
        case .red:
            return .systemRed
        case .black:
            return .black
        }
    }
    
    
    init(frame: CGRect, isAlive: Bool = false ) {
        super.init(frame: frame)
        self.isAlive = isAlive
        configureView()
        NotificationCenter.default.addObserver(self, selector: #selector(colorChanged), name: .didChangeCellColor, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func colorChanged() {
        if isAlive { backgroundColor = color }
    }
    
    func configureView() {
        self.backgroundColor = .white
    
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
    
    func makeDead() {
        self.isAlive = false
        self.backgroundColor = .white
    }
    
    func makeAlive() {
        isAlive = true
        backgroundColor = color
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isAlive == false {
            makeAlive()
        } else {
            makeDead()
        }
    }
}

