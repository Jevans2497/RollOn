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
    
    func setupBackground(imageName: String = "mountain.jpg") {
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
        nameBackground.run(fadeAwayAction(), completion: {
            self.hasSeenName = true
            nameBackground.removeFromParent()
        })
    }
    
    func fadeAwayAction() -> SKAction {
        let wait = SKAction.wait(forDuration: 1.5)
        let fade = SKAction.fadeOut(withDuration: 0.5)
        let sequence = SKAction.sequence([wait, fade])
        return sequence
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
        let attrString = NSMutableAttributedString(string: name)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let range = NSRange(location: 0, length: name.count)
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        attrString.addAttributes([.foregroundColor : UIColor.white, NSAttributedString.Key.font :
            UIFont(name: "Futura-Medium", size: 40)!], range: range)
        let nameLabel = SKLabelNode(attributedText: attrString)
        nameLabel.numberOfLines = 2
        nameLabel.position = CGPoint(x: 0, y: -50)
        return nameLabel
    }
}
