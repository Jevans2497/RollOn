//
//  Level1_6.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/6/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Level1_6: Level {
    
    override func setupLevel() {
        name = "Level 1-6:\nTBD"
        setupBackground()
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -300, y: -200)
        allObjects.append(hero)
        
        let wall1 = Wall(size: CGSize(width: 30, height: 100))
        wall1.position = CGPoint(x: 100, y: -50)
        allObjects.append(wall1)
        
        let wall2 = Wall(size: CGSize(width: 30, height: 100))
        wall2.position = CGPoint(x: -100, y: 50)
        allObjects.append(wall2)
        
        let toggleSwitch1 = ToggleSwitch(acceptedBallType: .Hero)
        toggleSwitch1.position = CGPoint(x: 50, y: -50)
        allObjects.append(toggleSwitch1)
        
        let toggleSwitch2 = ToggleSwitch(acceptedBallType: .Hero)
        toggleSwitch2.position = CGPoint(x: -50, y: 50)
        allObjects.append(toggleSwitch2)
        
        let goalInBox = GoalInBox().makeGoalInBox(goalPosition: CGPoint(x: 300, y: 100), acceptedBallType: .Hero)
        allObjects.append(contentsOf: goalInBox)
    }
}
