//
//  LevelTwo.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelTwo {
    
    var allObjects = Array<Any>()
    
    init() {
        setupLevel()
    }
    
    func setupLevel() {
        setupBackground()
//        let leftmost = (UIScreen.main.bounds.height / 2.0) * -1
        let position = CGPoint(x: 0, y: 0)
        let hero = HeroBall()
        hero.position = position
        allObjects.append(hero)
        
        let goal = Goal()
        goal.position = CGPoint(x: 375.0, y: 0.0)
        allObjects.append(goal)
        
        let wall1 = Wall(size: CGSize(width: 40.0, height: 150.0))
        wall1.position = CGPoint(x: 0.0, y: 300.0)
        wall1.zRotation = 4.4
        allObjects.append(wall1)
        
        let wall2 = Wall(size: CGSize(width: 40.0, height: 150.0))
        wall2.position = CGPoint(x: -200.0, y: -100.0)
        wall2.zRotation = 4.0
        allObjects.append(wall2)
        
        let wall3 = Wall(size: CGSize(width: 40.0, height: 150.0))
        wall3.position = CGPoint(x: 365.0, y: 320.0)
        wall3.zRotation = 4.3
        allObjects.append(wall3)
        
        let toggleSwitch1 = ToggleSwitch(acceptedBallType: .Hero)
        toggleSwitch1.position = CGPoint(x: 0.0, y: 240.0)
        allObjects.append(toggleSwitch1)
        
        let toggleSwitch2 = ToggleSwitch(acceptedBallType: .Hero)
        toggleSwitch2.position = CGPoint(x: -160, y: -50)
        allObjects.append(toggleSwitch2)
        
        let toggleSwitch3 = ToggleSwitch(acceptedBallType: .Hero)
        toggleSwitch3.position = CGPoint(x: 360, y: 265)
        allObjects.append(toggleSwitch3)
        
        let toggleWallBox = ToggleWallBox(center: goal.position, ballType: .Hero)
        allObjects.append(toggleWallBox)
    }
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "mountain.png")
        background.position = CGPoint(x: 0, y: 0)
        background.blendMode = .replace
        background.zPosition = -1
        allObjects.append(background)
    }
    
}
