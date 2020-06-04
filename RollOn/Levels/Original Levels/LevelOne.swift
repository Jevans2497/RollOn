//
//  LevelOne.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelOne: Level {
    
    override func setupLevel() {
        name = "Level 1: The Pilot"
        
        setupBackground(imageName: "mountain.png")
        let leftmost = (UIScreen.main.bounds.height / 2.0) * -1
        let position = CGPoint(x: 50 + leftmost, y: 0.0)
        let hero = HeroBall()
        hero.position = position
        allObjects.append(hero)
        
        let goalInBox = GoalInBox().makeGoalInBox(goalPosition: CGPoint(x: 375.0, y: 0.0), acceptedBallType: .Hero)
        allObjects.append(contentsOf: goalInBox)
        
        let blueToggleSwitch1 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch1.position = CGPoint(x: -200, y: 150)
        allObjects.append(blueToggleSwitch1)
        
        let blueToggleSwitch2 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch2.position = CGPoint(x: 25, y: -150)
        allObjects.append(blueToggleSwitch2)
        
        let blueToggleSwitch3 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch3.position = CGPoint(x: 250, y: 150)
        allObjects.append(blueToggleSwitch3)
                
        let wall1 = Wall(size: CGSize(width: 10000, height: 50))
        wall1.position = CGPoint(x: 0, y: 220)
        allObjects.append(wall1)
        
        let wall2 = Wall(size: CGSize(width: 10000, height: 50))
        wall2.position = CGPoint(x: 0, y: -220)
        allObjects.append(wall2)
    }
}
