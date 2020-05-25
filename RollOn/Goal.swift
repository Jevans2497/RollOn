//
//  Goal.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/24/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Goal: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "bouncer")
        let color = UIColor.clear
        let size = CGSize(width: texture.size().width / 2.0, height: texture.size().height / 2.0)
        super.init(texture: texture, color: color, size: size)
        
        setupPhysicsBody()
        zPosition = 5
        name = "goal"
    }
    
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = GoalCategory
        physicsBody?.contactTestBitMask = BallCategory
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
