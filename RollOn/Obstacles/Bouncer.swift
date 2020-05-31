//
//  Bouncer.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/30/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Bouncer: SKSpriteNode {
    
    enum BounceDirection {
        case up, down, left, right
    }
    
    var bounceDirection: BounceDirection
    
    init(size: CGSize, bounceDirection: BounceDirection) {
        self.bounceDirection = bounceDirection
        let texture = SKTexture(imageNamed: "spring")
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: size)
        name = "bouncer"
        setupPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhysicsBody() {
        let physicsBodySize = CGSize(width: size.width / 2.0, height: size.height / 2.0)
        physicsBody = SKPhysicsBody(rectangleOf: physicsBodySize)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask =  BouncerCategory
        physicsBody?.contactTestBitMask = HeroBallCategory | BombBallCategory
    }
    
    func bounce(ball: Ball) {
        let forceVector = getVectorByDirection()
        ball.physicsBody?.applyImpulse(forceVector)
    }
    
    func getVectorByDirection() -> CGVector {
        switch bounceDirection {
        case .up:
            return CGVector(dx: 0, dy: 50)
        case .down:
            return CGVector(dx: 0, dy: -50)
        case .left:
            return CGVector(dx: -50, dy: 0)
        case .right:
            return CGVector(dx: 50, dy: 0)
        }
    }
}
