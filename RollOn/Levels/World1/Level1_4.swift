//
//  WorldOneLevelFour.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/4/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Level1_4: Level {
    
    override func setupLevel() {
        name = "I'll think of it later"
        setupBackground()
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -350, y: -250)
        allObjects.append(hero)
    }
}
