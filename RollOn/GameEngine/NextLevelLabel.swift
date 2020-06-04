//
//  NextLevelLabel.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/2/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class NextLevelLabel: SKLabelNode {
    
    override init() {
        super.init()
        text = "Next Level"
        zPosition = 1000
        position = CGPoint(x: 400.0, y: 300.0)
        fontName = "Futura-Medium"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
