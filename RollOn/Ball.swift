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
    var clicked: Bool
    
    init(ballColor: String) {
        let texture = SKTexture(imageNamed: "ball\(ballColor)")
        let color = UIColor.clear
        let size = texture.size()
        startLocation = CGPoint(x: 0, y: 0)
        endLocation = CGPoint(x: 0, y: 0)
        clicked = false

        super.init(texture: texture, color: color, size: size)
        
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.restitution = 0.8
        name = "\(ballColor)_ball_\(UUID().uuidString)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func simulate() {
        if !clicked {
            physicsBody?.isDynamic = true
            let xDif = calculateXDif()
            let yDif = calculateYDif()
            let forceMultiplier = CGFloat(-20.0)
            physicsBody?.applyForce(CGVector(dx: xDif * forceMultiplier, dy: yDif * forceMultiplier))
            clicked = true
            resetBall()
        }
    }
    
    func calculateXDif() -> CGFloat {
        let startLocationX = startLocation.x
        let endLocationX = endLocation.x
        return endLocationX - startLocationX
    }
    
    func calculateYDif() -> CGFloat {
        let startLocationY = startLocation.y
        let endLocationY = endLocation.y
        return endLocationY - startLocationY
    }
    
    func resetBall() {
        startLocation = CGPoint(x: 0.0, y: 0.0)
        endLocation = CGPoint(x: 0.0, y: 0.0)
    }
}

