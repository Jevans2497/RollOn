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
        increaseSize()
        if !absorbedBalls.contains(ball) { absorbedBalls.append(ball) }
        ball.destroy()
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
            recreateBall(ball: ballToEject)
            absorbedBalls.removeLast()
        }
    }
    
    func recreateBall(ball: Ball) {
        let newBall = Ball(ballType: ball.ballType)
        newBall.position = CGPoint(x: 0, y: 0)
        newBall.physicsBody?.isDynamic = true
        parent?.addChild(newBall)
        newBall.physicsBody?.applyForce(CGVector(dx: 1000, dy: 0))
    }
    
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
