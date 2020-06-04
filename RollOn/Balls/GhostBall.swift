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
        super.init(ballType: .Ghost)
        alpha = 0.7
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupPhysicsBody() {
        physicsBody?.categoryBitMask = GhostBallCategory
        physicsBody?.contactTestBitMask = ToggleSwitchGrayCategory | HeroBallCategory | BombBallCategory
        physicsBody?.collisionBitMask = GoalCategory | ToggleSwitchBlueCategory | ToggleSwitchRedCategory | ToggleWallCategory | GhostWallCategory | GhostBallCategory
        physicsBody?.fieldBitMask = BombBallSecondaryEffectFieldCategory
    }
    
}
