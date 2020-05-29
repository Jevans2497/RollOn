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
    
    init(ballColor: String) {
        let texture = SKTexture(imageNamed: "ball\(ballColor)")
        let color = UIColor.clear
        let size = texture.size()
        startLocation = CGPoint(x: 0, y: 0)
        endLocation = CGPoint(x: 0, y: 0)
        arrow = Arrow()
        ballType = .Hero
        super.init(texture: texture, color: color, size: size)
        name = "ball\(ballColor)\(UUID().uuidString)"
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
            wasShot = true
            let forceVector = createForceVector()
            if forceVector.dx != 0.0 && forceVector.dy != 0.0 {
                physicsBody?.isDynamic = true
                physicsBody?.applyForce(forceVector)
                resetBall()
            }
        }
    }
    
    func runSecondaryEffect() {
        //Should always be overriden by balls that have secondary effects
    }
    
    func inGoal() {
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
        removeAllChildren()
    }
}

