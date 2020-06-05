//
//  WorldOneLevelFour.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/4/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Level1_8: Level {
    
    override func setupLevel() {
        name = "Level 1-8:\nThe Bunker"
        setupBackground()
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -350, y: -190)
        allObjects.append(hero)
        
        let goal = Goal()
        goal.position = CGPoint(x: 350, y: -190)
        allObjects.append(goal)
        
        let wall1 = Wall(size: CGSize(width: 30, height: 600))
        wall1.position = CGPoint(x: -400, y: -150)
        wall1.zRotation = 2.2
        allObjects.append(wall1)
        
        let wall2 = Wall(size: CGSize(width: 30, height: 600))
        wall2.position = CGPoint(x: 400, y: -150)
        wall2.zRotation = 4.08
        allObjects.append(wall2)
        
        let wall3 = Wall(size: CGSize(width: 350, height: 30))
        wall3.position = CGPoint(x: 0, y: 30)
        allObjects.append(wall3)
        
        let wall4 = Wall(size: CGSize(width: 30, height: 600))
        wall4.position = CGPoint(x: -400, y: -300)
        wall4.zRotation = 2.2
        allObjects.append(wall4)
        
        let wall5 = Wall(size: CGSize(width: 30, height: 600))
        wall5.position = CGPoint(x: 400, y: -300)
        wall5.zRotation = 4.08
        allObjects.append(wall5)
        
        let wall6 = Wall(size: CGSize(width: 340, height: 30))
        wall6.position = CGPoint(x: 0, y: -130)
        allObjects.append(wall6)
        
        let blueToggleSwitch = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch.position = CGPoint(x: 0, y: -20)
        allObjects.append(blueToggleSwitch)
    }
}
