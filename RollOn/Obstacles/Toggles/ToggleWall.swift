//
//  ToggleWall.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class ToggleWall: SKShapeNode {
    
    var acceptedBallType: BallType = .Hero
    var size = CGSize(width: 50.0, height: 50.0)
    
    convenience init(acceptedBallType: BallType, size: CGSize) {
        self.init()
        self.init(rectOf: size)

        self.acceptedBallType = acceptedBallType
        self.size = size
        setupPhysicsBody()
        fillColor = getColorBasedOnAcceptedBallType()
        name = "toggleWall\(acceptedBallType)"
    }
    
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask =  getCategoryBitMaskByAcceptedBallColor()
        physicsBody?.collisionBitMask = HeroBallCategory | BombBallCategory
    }
    
    private func getColorBasedOnAcceptedBallType() -> UIColor {
        switch acceptedBallType {
        case .Hero:
            return UIColor.blue
        case .Bomb:
            return UIColor.red
        case .Ghost:
            return UIColor.gray
        }
    }
    
    func getCategoryBitMaskByAcceptedBallColor() -> UInt32 {
        switch acceptedBallType {
        case .Hero:
            return ToggleWallBlueCategory
        case .Bomb:
            return ToggleWallRedCategory
        case .Ghost:
            return ToggleWallGrayCategory
        }
    }
}
