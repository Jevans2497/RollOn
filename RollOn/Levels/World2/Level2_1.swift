//
//  Level2_1.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/6/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Level2_1: Level {
    
    override func setupLevel() {
        name = "Level 2-1:\nLoading the Cannon"
        setupBackground()
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -250, y: -200)
        allObjects.append(hero)
        
        let bomb = BombBall()
        bomb.position = CGPoint(x: -350, y: -200)
        allObjects.append(bomb)
        
        let goal = Goal()
        goal.position = CGPoint(x: 400, y: 200)
        allObjects.append(goal)
        
        let wallLeft = Wall(size: CGSize(width: 30, height: 100))
        wallLeft.position = CGPoint(x: -400, y: 200)
        allObjects.append(wallLeft)
        
        let wallTop = Wall(size: CGSize(width: 1030, height: 30))
        wallTop.position = CGPoint(x: 100, y: 260)
        allObjects.append(wallTop)
        
        let wallBottom = Wall(size: CGSize(width: 830, height: 30))
        wallBottom.position = CGPoint(x: 200, y: 140)
        allObjects.append(wallBottom)
        
        let wallDivider = Wall(size: CGSize(width: 15, height: 100))
        wallDivider.position = CGPoint(x: -300, y: 200)
        allObjects.append(wallDivider)
        
        let redToggleSwitch = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch.position = CGPoint(x: -350, y: 200)
        allObjects.append(redToggleSwitch)
        
        let redWall = ToggleWall(acceptedBallType: .Bomb, size: CGSize(width: 15, height: 100))
        redWall.position = CGPoint(x: -200, y: 200)
        allObjects.append(redWall)
        
        let tutorial = TutorialLabel().makeLabel(tutorialString: "After start, click on the red ball")
        tutorial.position = CGPoint(x: 100, y: -215)
        allObjects.append(tutorial)
    }
}
