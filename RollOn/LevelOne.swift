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
        let leftmost = (UIScreen.main.bounds.height / 2.0) * -1
        let position = CGPoint(x: 150 + leftmost, y: 0.0)
        let hero = HeroBall()
        hero.position = position
        
        let bombPosition = CGPoint(x: 300, y: 0.0)
        let bombBall = BombBall()
        bombBall.position = bombPosition
        
        let goal = Goal()
        goal.position = CGPoint(x: 0.0, y: 0.0)
        
        
        let blueToggleSwitch = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch.position = CGPoint(x: 0.0, y: 150.0)
        
        let redToggleSwitch = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch.position = CGPoint(x: 0.0, y: -150.0)
        
        allObjects.append(redToggleSwitch)
        allObjects.append(hero)
        allObjects.append(bombBall)
        allObjects.append(goal)
        allObjects.append(blueToggleSwitch)
    }
    
}
