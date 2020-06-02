//
//  LevelTen.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/2/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelTen: Level {
    
    override func setupLevel() {
        setupBackground(imageName: "mountain.jpg")
        
        let hero = HeroBall()
        hero.position = CGPoint(x: 400, y: 0)
        allObjects.append(hero)
        
        let bomb = BombBall()
        bomb.position = CGPoint(x: -400, y: 0)
        allObjects.append(bomb)
        
        
        
        let goalInBox = GoalInBox().makeGoalInBox(goalPosition: CGPoint(x: 300, y: 0), acceptedBallType: .Hero)
        allObjects.append(contentsOf: goalInBox)
        
        
        
        let wallLeft = Wall(size: CGSize(width: 20, height: 100))
        wallLeft.position = CGPoint(x: -350, y: 0)
        allObjects.append(wallLeft)
 
        
        
        
        
        let redToggleSwitch1 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch1.position = CGPoint(x: -50, y: 250)
        allObjects.append(redToggleSwitch1)
        
        let redToggleSwitch2 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch2.position = CGPoint(x: -50, y: 125)
        allObjects.append(redToggleSwitch2)
        
        let redToggleSwitch3 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch3.position = CGPoint(x: -50, y: 0)
        allObjects.append(redToggleSwitch3)
        
        let redToggleSwitch4 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch4.position = CGPoint(x: -50, y: -125)
        allObjects.append(redToggleSwitch4)
        
        let redToggleSwitch5 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch5.position = CGPoint(x: -50, y: -250)
        allObjects.append(redToggleSwitch5)
        
        let blueToggleSwitch1 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch1.position = CGPoint(x: 50, y: 250)
        allObjects.append(blueToggleSwitch1)
        
        let blueToggleSwitch2 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch2.position = CGPoint(x: 50, y: 125)
        allObjects.append(blueToggleSwitch2)
        
        let blueToggleSwitch3 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch3.position = CGPoint(x: 50, y: 0)
        allObjects.append(blueToggleSwitch3)
        
        let blueToggleSwitch4 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch4.position = CGPoint(x: 50, y: -125)
        allObjects.append(blueToggleSwitch4)
        
        let blueToggleSwitch5 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch5.position = CGPoint(x: 50, y: -250)
        allObjects.append(blueToggleSwitch5)
    }
}
