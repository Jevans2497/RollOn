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
    var hasSeenName = false
    
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
    
    func displayName() {
        let nameBackground = makeNameBackground()
        let nameLabel = makeNameLabel()
        
        nameBackground.addChild(nameLabel)
        allObjects.append(nameBackground)
        hasSeenName = true
    }
    
    private func makeNameBackground() -> SKShapeNode {
        let nameBackground = SKShapeNode(rectOf: CGSize(width: 1200, height: 150))
        nameBackground.fillColor = .black
        nameBackground.alpha = 0.7
        nameBackground.zPosition = 10000
        nameBackground.position = CGPoint(x: 0, y: 0)
        return nameBackground
    }
    
    private func makeNameLabel() -> SKLabelNode {
        return SKLabelNode(text: name)
    }
}
