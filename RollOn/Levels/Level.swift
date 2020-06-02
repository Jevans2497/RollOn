//
//  Level.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/29/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Level {
    
    var allObjects = Array<Any>()
    var name = "Level"
    
    init() {
        setupLevel()
    }
    
    func setupLevel() {
        //Should always be overriden
    }
    
    func setupBackground(imageName: String) {
        let background = SKSpriteNode(imageNamed: imageName)
        background.position = CGPoint(x: 0, y: 0)
        background.blendMode = .replace
        background.zPosition = -1
        allObjects.append(background)
    }
}
