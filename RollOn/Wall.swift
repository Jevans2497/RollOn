//
//  Wall.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Wall: SKSpriteNode {
    
    init(size: CGSize) {
        let texture = SKTexture(imageNamed: "brick")
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: size)
        
        name = "wall"
        setupPhysicsBody()
    }
    
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(rectangleOf: self.size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask =  WallCategory
        physicsBody?.collisionBitMask = HeroBallCategory | BombBallCategory
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
