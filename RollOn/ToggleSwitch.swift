//
//  ToggleSwitch.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class ToggleSwitch : SKShapeNode {
    
    let radius: CGFloat = 20.0
    var hasBeenToggled = false
    var acceptedBallType: BallType = .Hero

    convenience init(acceptedBallType: BallType) {
        self.init()
        self.init(circleOfRadius: radius)

        self.acceptedBallType = acceptedBallType
        setupPhysicsBody()
        fillColor = getColorBasedOnAcceptedBallType()
        drawBorder(color: UIColor.lightGray, radius: radius)
        name = "toggleSwitch\(acceptedBallType)"
    }
    
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: radius)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask =  getCategoryBitMaskByAcceptedBallColor()
        physicsBody?.contactTestBitMask = getContactTestBitMaskByAcceptedBallColor()
        physicsBody?.collisionBitMask = HeroBallCategory | BombBallCategory
    }
    
    func getCategoryBitMaskByAcceptedBallColor() -> UInt32 {
        switch acceptedBallType {
        case .Hero:
            return ToggleSwitchBlueCategory
        case .Bomb:
            return ToggleSwitchRedCategory
        }
    }
    
    func getContactTestBitMaskByAcceptedBallColor() -> UInt32 {
        switch acceptedBallType {
        case .Hero:
            return HeroBallCategory
        case .Bomb:
            return BombBallCategory
        }
    }
    
    func toggle() {
        if !hasBeenToggled {
            self.removeAllChildren()
            drawBorder(color: getColorBasedOnAcceptedBallType(), radius: radius)
            hasBeenToggled = true
        }
    }
    
    private func getColorBasedOnAcceptedBallType() -> UIColor {
        switch acceptedBallType {
        case .Hero:
            return UIColor.blue
        case .Bomb:
            return UIColor.red
        }
    }
}

extension SKShapeNode {
    func drawBorder(color: UIColor, radius: CGFloat) {
        let shapeNode = SKShapeNode(circleOfRadius: radius)
        shapeNode.fillColor = .clear
        shapeNode.strokeColor = color
        shapeNode.lineWidth = radius
        addChild(shapeNode)
    }
}
