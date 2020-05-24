//
//  Ball.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/23/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import SpriteKit

class Ball: SKSpriteNode {
    
    var startLocation: CGPoint
    var endLocation: CGPoint
    
    init(ballColor: String) {
        let texture = SKTexture(imageNamed: "ball\(ballColor)")
        let color = UIColor.clear
        let size = texture.size()
        startLocation = CGPoint(x: 0, y: 0)
        endLocation = CGPoint(x: 0, y: 0)

        super.init(texture: texture, color: color, size: size)
        
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.isDynamic = false
        physicsBody?.restitution = 0.8
        name = "\(ballColor)_ball_\(UUID().uuidString)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func simulate() {
        physicsBody?.isDynamic = true
        let startLocationX = startLocation.x
        let startLocationY = startLocation.y
        let endLocationX = endLocation.x
        let endLocationY = endLocation.y
        let xDif = endLocationX - startLocationX
        let yDif = endLocationY - startLocationY
        physicsBody?.applyForce(CGVector(dx: xDif * -20, dy: yDif * -20))
        resetBall()
    }
    
    func resetBall() {
        startLocation = CGPoint(x: 0.0, y: 0.0)
        endLocation = CGPoint(x: 0.0, y: 0.0)
    }
}

