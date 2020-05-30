//
//  Spikes.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/30/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Spikes: SKSpriteNode {
    
    init(size: CGSize) {
        let texture = SKTexture(imageNamed: "spikes")
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: size)
        name = "spikes"
        setupPhysicsBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhysicsBody() {
        physicsBody = SKPhysicsBody(rectangleOf: self.size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask =  SpikesCategory
        physicsBody?.contactTestBitMask = HeroBallCategory | BombBallCategory
    }
}
