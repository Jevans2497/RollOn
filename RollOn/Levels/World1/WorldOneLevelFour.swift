//
//  WorldOneLevelFour.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/4/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class WorldOneLevelFour: Level {
    
    override func setupLevel() {
        name = "I'll think of it later"
        setupBackground()
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -400, y: -300)
        allObjects.append(hero)
    }
}
