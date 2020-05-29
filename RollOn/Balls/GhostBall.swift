//
//  GhostBall.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/28/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class GhostBall: Ball {
    
    init() {
        super.init(ballColor: "Grey")
        ballType = .Ghost
        alpha = 0.7
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.restitution = 0.8
        physicsBody?.categoryBitMask = GhostBallCategory
        physicsBody?.contactTestBitMask = GoalCategory | ToggleSwitchGrayCategory
        physicsBody?.collisionBitMask = ToggleSwitchBlueCategory | ToggleSwitchRedCategory
        physicsBody?.fieldBitMask = BombBallSecondaryEffectFieldCategory
    }
    
}
