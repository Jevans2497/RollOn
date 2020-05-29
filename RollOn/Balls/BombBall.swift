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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.restitution = 0.8
        physicsBody?.categoryBitMask = BombBallCategory
        physicsBody?.contactTestBitMask = GoalCategory | ToggleSwitchRedCategory
        physicsBody?.collisionBitMask = HeroBallCategory | WallCategory | ToggleSwitchBlueCategory | ToggleWallRedCategory | BombBallCategory | ToggleSwitchGrayCategory
    }
    
    override func runSecondaryEffect() {
        if !hasActivatedSecondaryEffect && wasShot {
            blowUp()
            hasActivatedSecondaryEffect = true
        }
    }
    
    func blowUp() {
        physicsBody?.fieldBitMask = BombBallCategory // To avoid having the explosion effect on the calling ball
        let gravityField = makeGravityField()
        addChild(gravityField)
        activateBombParticleEffect()
        run(setToBlackAction())
        run(pulseAction(scaleTo: 1.8), completion: {
            gravityField.removeFromParent()
            self.physicsBody?.fieldBitMask = .zero
        })
    }
    
    private func makeGravityField() -> SKFieldNode {
        let gravityNode = SKFieldNode.radialGravityField()
        gravityNode.categoryBitMask = BombBallSecondaryEffectFieldCategory
        gravityNode.strength = -1
        gravityNode.region = SKRegion(radius: 80.0)
        gravityNode.falloff = 3
        return gravityNode
    }
    
    private func activateBombParticleEffect() {
        if let bombParticles = SKEmitterNode(fileNamed: "BombParticle.sks") {
            addChild(bombParticles)
        }
    }
    
    private func pulseAction(scaleTo: CGFloat) -> SKAction {
        let pulseUp = SKAction.scale(to: scaleTo, duration: 0.1)
        let pulseDown = SKAction.scale(to: 1.0, duration: 0.1)
        let pulseAction = SKAction.sequence([pulseUp, pulseDown])
        return pulseAction
    }
    
    private func setToBlackAction() -> SKAction {
        color = .black
        let setToBlack = SKAction.colorize(withColorBlendFactor: 0.7, duration: 0.4)
        return setToBlack
    }
}
