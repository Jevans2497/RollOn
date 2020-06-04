//
//  Ball.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/23/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import SpriteKit

enum BallType { case Hero, Bomb, Ghost }

class Ball: SKSpriteNode {
    
    var startLocation: CGPoint {
        didSet { arrow.ballLocation = startLocation }
    }
    var endLocation: CGPoint
    var arrow: Arrow
    var ballType: BallType
    var wasShot = false
    var hasActivatedSecondaryEffect = false
    
    init(ballType: BallType) {
        let ballTexture = SKTexture(imageNamed: "ballBlue")
        let color = UIColor.clear
        let size = ballTexture.size()
        startLocation = CGPoint(x: 0, y: 0)
        endLocation = CGPoint(x: 0, y: 0)
        arrow = Arrow()
        self.ballType = ballType
        super.init(texture: ballTexture, color: color, size: size)
        
        physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2.0)
        physicsBody?.restitution = 0.8
        texture = textureByBallType(ballType: ballType)
        name = "ball\(ballType)\(UUID().uuidString)"
        arrow.name! += name!
        zPosition = 50
        setupPhysicsBody()
    }
    
    func setupPhysicsBody() {
        //Should always be overridden
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawArrow(location: CGPoint) {
        if !wasShot {
            let arrowToDraw = arrow
            arrow.removeFromParent()
            arrowToDraw.touchLocation = location
            parent?.addChild(arrowToDraw)
        }
    }
    
    func simulate() {
        if !wasShot {
            let forceVector = createForceVector()
            physicsBody?.isDynamic = true
            physicsBody?.applyForce(forceVector)
            resetBall()
            wasShot = true
        }
    }
    
    func runSecondaryEffect() {
        //Should always be overriden by balls that have secondary effects
    }
    
    func inGoal() {
        destroy()
    }
    
    func destroy() {
        let shrinkAction = SKAction.scale(by: 0.0, duration: 0.2)
        physicsBody?.isDynamic = false
        self.run(shrinkAction, completion: self.removeFromParent)
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
        arrow.removeFromParent()
        hasActivatedSecondaryEffect = false
        removeAllChildren()
    }
    
    private func textureByBallType(ballType: BallType) -> SKTexture {
        var ballColor = ""
        switch ballType {
            case .Hero:
                ballColor = "Blue"
            case .Bomb:
                ballColor = "Red"
            case .Ghost:
                ballColor = "Grey"
        }
        return SKTexture(imageNamed: "ball\(ballColor)")
    }
    
    func ghostBallCollision() {
        if let smokeParticles = SKEmitterNode(fileNamed: "SmokeParticle.sks") {
            addChild(smokeParticles)
        }
    }
}

