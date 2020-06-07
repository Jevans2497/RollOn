//
//  Level4_1.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/7/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Level4_1: Level {
    
    override func setupLevel() {
        name = "Level 4-1:\nTBD"
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -300, y: 0)
        allObjects.append(hero)
        
        let absorb = AbsorbBall()
        absorb.position = CGPoint(x: -100, y: 0)
        allObjects.append(absorb)
    }
}
