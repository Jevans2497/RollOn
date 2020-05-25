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
        super.init(ballColor: "Blue")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.restitution = 0.8
        physicsBody?.categoryBitMask = HeroBallCategory
        physicsBody?.contactTestBitMask = GoalCategory
        physicsBody?.collisionBitMask = BombBallCategory | WallCategory
    }
    
}
