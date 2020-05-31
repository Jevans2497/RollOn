//
//  GhostWall.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/30/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class GhostWall: SKSpriteNode {
    
    init(size: CGSize) {
        let texture = SKTexture(imageNamed: "brick")
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: size)
 
        alpha = 0.5
        name = "ghostWall"
        setupPhysicsBody()
    }
    
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(rectangleOf: self.size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = GhostWallCategory
        physicsBody?.collisionBitMask = GhostBallCategory
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
