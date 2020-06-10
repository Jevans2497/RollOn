//
//  AbsorbBall.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/7/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class AbsorbBall: Ball {
    
    var absorbedBalls = Array<Ball>()
    
    init() {
        super.init(ballType: .Absorb)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupPhysicsBody() {
        physicsBody?.categoryBitMask = AbsorbBallCategory
        physicsBody?.contactTestBitMask = ToggleSwitchWhiteCategory | SpikesCategory | BouncerCategory | GhostBallCategory | BombBallCategory | HeroBallCategory
        physicsBody?.collisionBitMask = WallCategory | ToggleSwitchBlueCategory | ToggleWallCategory | ToggleSwitchGrayCategory | GoalCategory | ToggleSwitchRedCategory
    }
    
    func absorb(ball: Ball) {
        if !absorbedBalls.contains(ball) {
            absorbedBalls.append(ball)
            increaseSize()
            ball.destroy()
        }
    }
    
    func increaseSize() {
        let oldSize = size
        size = CGSize(width: oldSize.width * 1.1, height: oldSize.height * 1.1)
    }
    
    func decreaseSize() {
        let oldSize = size
        size = CGSize(width: oldSize.width / 1.1, height: oldSize.height / 1.1)
    }
    
    override func runSecondaryEffect() {
        if let ballToEject = absorbedBalls.last {
            decreaseSize()
            ejectBall(ball: ballToEject)
            absorbedBalls.removeLast()
        }
    }
    
    func ejectBall(ball: Ball) {
        let ballToEject = Ball(ballType: ball.ballType)
        ballToEject.position = ejectionPosition()
        parent?.addChild(ballToEject)
        ballToEject.physicsBody?.applyForce(calculateEjectionVector(ballToEject: ballToEject))
    }
    
    func ejectionPosition() -> CGPoint {
        let angle = calculateEjectionAngle()
        let adjustedX = CGFloat(cos(angle) * size.width) + position.x
        let adjustedY = CGFloat(sin(angle) * size.height) + position.y
        return CGPoint(x: adjustedX, y: adjustedY)
    }
    
    func calculateEjectionVector(ballToEject: Ball) -> CGVector {
        let velocityX = physicsBody?.velocity.dx
        let velocityY = physicsBody?.velocity.dy
        return CGVector(dx: velocityX! * 10, dy: velocityY! * 10)
    }
    
    //The direction that the absorb ball is currently moving in (radians)
    func calculateEjectionAngle() -> CGFloat {
        let velocity = physicsBody?.velocity
        let startX = position.x
        let startY = position.y
        let targetX = startX + velocity!.dx
        let targetY = startY + velocity!.dy
        let angle = atan2(targetY - startY, targetX - startX)
        return angle
    }
}
