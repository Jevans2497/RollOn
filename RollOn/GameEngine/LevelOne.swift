//
//  LevelOne.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelOne {
    
    var allObjects = Array<Any>()
    
    init() {
        setupLevel()
    }
    
    func setupLevel() {
        setupBackground()
        let leftmost = (UIScreen.main.bounds.height / 2.0) * -1
        let position = CGPoint(x: 50 + leftmost, y: 0.0)
        let hero = HeroBall()
        hero.position = position
        allObjects.append(hero)
        
        let bombTest = BombBall()
        bombTest.position = CGPoint(x: 80 + leftmost, y: 0.0)
        allObjects.append(bombTest)
        
        let goal = Goal()
        goal.position = CGPoint(x: 375.0, y: 0.0)
        allObjects.append(goal)
        
        let toggleWall1 = ToggleWall(acceptedBallType: .Hero, size: CGSize(width: 10, height: 100))
        toggleWall1.position = CGPoint(x: 325, y: 0.0)
        allObjects.append(toggleWall1)
        
        let toggleWall2 = ToggleWall(acceptedBallType: .Hero, size: CGSize(width: 100, height: 10))
        toggleWall2.position = CGPoint(x: 375, y: 50)
        allObjects.append(toggleWall2)
        
        let toggleWall3 = ToggleWall(acceptedBallType: .Hero, size: CGSize(width: 10, height: 100))
        toggleWall3.position = CGPoint(x: 425, y: 0.0)
        allObjects.append(toggleWall3)
        
        let toggleWall4 = ToggleWall(acceptedBallType: .Hero, size: CGSize(width: 100, height: 10))
        toggleWall4.position = CGPoint(x: 375, y: -50)
        allObjects.append(toggleWall4)
        
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
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "mountain.png")
        background.position = CGPoint(x: 0, y: 0)
        background.blendMode = .replace
        background.zPosition = -1
        allObjects.append(background)
    }
    
}
