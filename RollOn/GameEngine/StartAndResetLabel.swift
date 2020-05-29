//
//  StartAndResetLabel.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/29/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class StartAndResetLabel: SKLabelNode {
    
    override init() {
        super.init()
        text = "Start"
        zPosition = 1000
        position = CGPoint(x: -420.0, y: 300.0)
        fontName = "Chalkduster"
    }
    
    func shouldStart() -> Bool {
        return text == "Start"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
