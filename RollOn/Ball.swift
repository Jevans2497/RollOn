//
//  Ball.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/23/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import SpriteKit

class Ball: SKSpriteNode {
    
    var startLocation: CGPoint {
        didSet {
            arrow.ballLocation = startLocation
        }
    }
    var endLocation: CGPoint
    var clicked: Bool
    var arrow: Arrow
    
    init(ballColor: String) {
        let texture = SKTexture(imageNamed: "ball\(ballColor)")
        let color = UIColor.clear
        let size = texture.size()
        startLocation = CGPoint(x: 0, y: 0)
        endLocation = CGPoint(x: 0, y: 0)
        clicked = false
        arrow = Arrow()

        super.init(texture: texture, color: color, size: size)
        
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.restitution = 0.8
        name = "\(ballColor)ball"
        arrow.name! += name!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func simulate() {
//        if !clicked {
        let forceVector = createForceVector()
        if forceVector.dx != 0.0 && forceVector.dy != 0.0 {
            physicsBody?.isDynamic = true
            physicsBody?.applyForce(forceVector)
            resetBall()
            clicked = true
        }
//        }
    }
    
    func createForceVector() -> CGVector {
        let xDif = calculateXDif()
        let yDif = calculateYDif()
        let forceMultiplier = CGFloat(-20.0)
        return CGVector(dx: xDif * forceMultiplier, dy: yDif * forceMultiplier)
    }
    
    private func calculateXDif() -> CGFloat {
        let startLocationX = startLocation.x
        let endLocationX = endLocation.x
        return endLocationX - startLocationX
    }
    
    private func calculateYDif() -> CGFloat {
        let startLocationY = startLocation.y
        let endLocationY = endLocation.y
        return endLocationY - startLocationY
    }
    
    func resetBall() {
        startLocation = CGPoint(x: 0.0, y: 0.0)
        endLocation = CGPoint(x: 0.0, y: 0.0)
    }
}

