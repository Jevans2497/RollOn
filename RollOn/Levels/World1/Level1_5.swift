//
//  Level1_5.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/4/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Level1_5: Level {
    
    override func setupLevel() {
        name = "TBD"
        setupBackground()
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -350, y: -200)
        allObjects.append(hero)
        
        let goalInBox = GoalInBox().makeGoalInBox(goalPosition: CGPoint(x: -250, y: -200), acceptedBallType: .Hero)
        allObjects.append(contentsOf: goalInBox)
        
        let leftWall = Wall(size: CGSize(width: 30, height: 750))
        leftWall.position = CGPoint(x: -430, y: -100)
        allObjects.append(leftWall)
        
        let topWall = Wall(size: CGSize(width: 800, height: 30))
        topWall.position = CGPoint(x: 0, y: 300)
        allObjects.append(topWall)
        
        let topWallBottom = Wall(size: CGSize(width: 600, height: 30))
        topWallBottom.position = CGPoint(x: 0, y: 200)
        allObjects.append(topWallBottom)
        
        let rightWall = Wall(size: CGSize(width: 30, height: 750))
        rightWall.position = CGPoint(x: 430, y: -100)
        allObjects.append(rightWall)
        
        let bottomWall = Wall(size: CGSize(width: 600, height: 30))
        bottomWall.position = CGPoint(x: 100, y: -250)
        allObjects.append(bottomWall)
        
        let rightWallLeft = Wall(size: CGSize(width: 30, height: 320))
        rightWallLeft.position = CGPoint(x: 310, y: 50)
        allObjects.append(rightWallLeft)
        
        let leftWallAngled = Wall(size: CGSize(width: 100, height: 30))
        leftWallAngled.position = CGPoint(x: -390, y: 250)
        leftWallAngled.zRotation = 1
        allObjects.append(leftWallAngled)
        
        let rightWallAngled = Wall(size: CGSize(width: 100, height: 30))
        rightWallAngled.position = CGPoint(x: 400, y: 260)
        rightWallAngled.zRotation = 5.5
        allObjects.append(rightWallAngled)
        
        let bottomWallAngled = Wall(size: CGSize(width: 100, height: 30))
        bottomWallAngled.position = CGPoint(x: 400, y: -230)
        bottomWallAngled.zRotation = 1
        allObjects.append(bottomWallAngled)
        
        let toggleSwitch1 = ToggleSwitch(acceptedBallType: .Hero)
        toggleSwitch1.position = CGPoint(x: -340, y: 230)
        allObjects.append(toggleSwitch1)
    }
}
