//
//  Level1_4.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/4/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Level1_4: Level {
    
    override func setupLevel() {
        name = "Level 1-4:\n.-."
        
        setupBackground()
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -350, y: 0)
        allObjects.append(hero)
        
        let wall = Wall(size: CGSize(width: 200, height: 30))
        wall.position = CGPoint(x: 0, y: 300)
        allObjects.append(wall)
        
        let toggleSwitch1 = ToggleSwitch(acceptedBallType: .Hero)
        toggleSwitch1.position = CGPoint(x: -150, y: 150)
        allObjects.append(toggleSwitch1)
        
        let toggleSwitch2 = ToggleSwitch(acceptedBallType: .Hero)
        toggleSwitch2.position = CGPoint(x: 150, y: 150)
        allObjects.append(toggleSwitch2)
        
        let goalInBox = GoalInBox().makeGoalInBox(goalPosition: CGPoint(x: 350, y: 0), acceptedBallType: .Hero)
        allObjects.append(contentsOf: goalInBox)
    }
}
