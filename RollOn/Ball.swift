//
//  Ball.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/23/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import SpriteKit

class Ball: SKSpriteNode {
    
    init(ballColor: String) {
        let texture = SKTexture(imageNamed: "ball\(ballColor)")
        let color = UIColor.clear
        let size = texture.size()

        super.init(texture: texture, color: color, size: size)
        
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.isDynamic = false
        physicsBody?.restitution = 0.5
        name = "\(ballColor)_ball_\(UUID().uuidString)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

