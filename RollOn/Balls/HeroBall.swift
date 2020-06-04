//
//  HeroBall.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class HeroBall: Ball {
    
    init() {
        super.init(ballType: .Hero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupPhysicsBody() {
        physicsBody?.categoryBitMask = HeroBallCategory
        physicsBody?.contactTestBitMask = GoalCategory | ToggleSwitchBlueCategory | SpikesCategory | BouncerCategory | GhostBallCategory
        physicsBody?.collisionBitMask = BombBallCategory | WallCategory | ToggleSwitchRedCategory | ToggleWallCategory | ToggleSwitchGrayCategory
        physicsBody?.fieldBitMask = BombBallSecondaryEffectFieldCategory
    }
    
}
