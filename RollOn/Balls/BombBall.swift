//
//  BombBall.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class BombBall: Ball {
    
    init() {
        super.init(ballColor: "Red")
        ballType = .Bomb
        name = "\(BallType.Bomb)ball"
        arrow.name! += name!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.restitution = 0.8
        physicsBody?.categoryBitMask = BombBallCategory
        physicsBody?.contactTestBitMask = GoalCategory | ToggleSwitchRedCategory
        physicsBody?.collisionBitMask = HeroBallCategory | WallCategory | ToggleSwitchBlueCategory | ToggleWallRedCategory
    }
    
    override func runSecondaryEffect() {
        if !hasActivatedSecondaryEffect && wasShot {
            blowUp()
            hasActivatedSecondaryEffect = true
        }
    }
    
    func blowUp() {
        let gravityVector = vector_float3(1,0,1);

        let gravityNode = SKFieldNode.radialGravityField()
        gravityNode.categoryBitMask = BombBallSecondaryEffectCategory
        gravityNode.strength = -1
        gravityNode.region = SKRegion(radius: 100.0)
        gravityNode.falloff = 4

        addChild(gravityNode)
        run(shockWaveAction(scaleTo: 1.1), completion: {
            gravityNode.removeFromParent()
        })
    }
    
    func nodesInRadius() -> Array<SKNode> {
        guard let allNodes = parent?.children else { return Array<SKNode>() }
        var nodesInRadius = Array<SKNode>()
        for node in allNodes {
            if let isBall = node.name?.contains("ball") {
                if isBall {
                    if ballInRadius(ballPosition: node.position) { nodesInRadius.append(node) }
                }
            }
        }
        return nodesInRadius
    }
    
    func afterBlowUp() {
        
    }
    
    private func shockWaveAction(scaleTo: CGFloat) -> SKAction {
        let shockWaveAction: SKAction = {
            let growAction = SKAction.group([SKAction.scale(to: scaleTo, duration: 0.1)])
            let sequence = SKAction.sequence([growAction])
            return sequence
        }()
        return shockWaveAction
    }
    
    private func ballInRadius(ballPosition: CGPoint) -> Bool {
        let region = SKRegion(radius: 100.0)
        return region.contains(ballPosition)
    }
}
