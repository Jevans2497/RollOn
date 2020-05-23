//
//  Ball.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/23/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import SpriteKit

class Ball: SKNode {
    
    init(color: String, position: CGPoint) {
        super.init()
        let ball = SKSpriteNode(imageNamed: "ball\(color)")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
        ball.physicsBody?.isDynamic = false
        ball.physicsBody?.restitution = 0.5
        ball.position = position
        ball.name = "\(color) \(UUID().uuidString)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

