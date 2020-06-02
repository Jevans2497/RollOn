//
//  LevelFive.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/30/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelFive: Level {
    
    override func setupLevel() {
        name = "Level 5: Spikes and Pikes"
        
        setupBackground(imageName: "mountain.jpg")
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -350, y: 0.0)
        allObjects.append(hero)
        
        let goalInBox = GoalInBox().makeGoalInBox(goalPosition: CGPoint(x: 400.0, y: 0.0), acceptedBallType: .Hero)
        allObjects.append(contentsOf: goalInBox)
        
        let spikes1 = Spikes(size: CGSize(width: 100.0, height: 15))
        spikes1.position = CGPoint(x: -200, y: 250)
        allObjects.append(spikes1)
        
        let blueToggle1 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggle1.position = CGPoint(x: -200, y: 200)
        allObjects.append(blueToggle1)
        
        let spikes2 = Spikes(size: CGSize(width: 100.0, height: 15))
        spikes2.position = CGPoint(x: 0, y: -250)
        allObjects.append(spikes2)
        
        let blueToggle2 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggle2.position = CGPoint(x: 0, y: -180)
        allObjects.append(blueToggle2)
        
        let spikes3 = Spikes(size: CGSize(width: 100.0, height: 15))
        spikes3.position = CGPoint(x: 200, y: 250)
        allObjects.append(spikes3)
        
        let blueToggle3 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggle3.position = CGPoint(x: 200, y: 200)
        allObjects.append(blueToggle3)
        
        let bombBall1 = BombBall()
        bombBall1.position = CGPoint(x: -200, y: 280)
        allObjects.append(bombBall1)
        
        let bombBall2 = BombBall()
        bombBall2.position = CGPoint(x: 0, y: -280)
        allObjects.append(bombBall2)
        
        let bombBall3 = BombBall()
        bombBall3.position = CGPoint(x: 200, y: 280)
        allObjects.append(bombBall3)
    }
}
