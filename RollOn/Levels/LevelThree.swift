//
//  LevelThree.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/29/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelThree: Level {
    
    override func setupLevel() {
        name = "Level 3: Time Bomb"
        
        setupBackground(imageName: "mountain.jpg")
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -400, y: 0.0)
        allObjects.append(hero)
        
        let bombLeftOfHero = BombBall()
        bombLeftOfHero.position = CGPoint(x: -470, y: 0)
        allObjects.append(bombLeftOfHero)
        
        let bombTopRight = BombBall()
        bombTopRight.position = CGPoint(x: 400, y: 320)
        allObjects.append(bombTopRight)
        
        let bombTopRightBelow = BombBall()
        bombTopRightBelow.position = CGPoint(x: 400, y: 250)
        allObjects.append(bombTopRightBelow)
        
        let ghost = GhostBall()
        ghost.position = CGPoint(x: -435, y: -300)
        allObjects.append(ghost)
        
        
        
        let goalPosition = CGPoint(x: 400, y: -300)
        let goal = Goal()
        goal.position = goalPosition
        allObjects.append(goal)
        
        let goalPosX = goalPosition.x
        let goalPosY = goalPosition.y
        
        let toggleWall1 = ToggleWall(acceptedBallType: .Bomb, size: CGSize(width: 10, height: 100))
        toggleWall1.position = CGPoint(x: goalPosX - 50, y: goalPosY)
        allObjects.append(toggleWall1)
        
        let toggleWall2 = ToggleWall(acceptedBallType: .Hero, size: CGSize(width: 100, height: 10))
        toggleWall2.position = CGPoint(x: goalPosX, y: goalPosY + 50)
        allObjects.append(toggleWall2)
        
        let toggleWall3 = ToggleWall(acceptedBallType: .Bomb, size: CGSize(width: 10, height: 100))
        toggleWall3.position = CGPoint(x: goalPosX + 50, y: goalPosY)
        allObjects.append(toggleWall3)
        
        let toggleWall4 = ToggleWall(acceptedBallType: .Bomb, size: CGSize(width: 100, height: 10))
        toggleWall4.position = CGPoint(x: goalPosX, y: goalPosY - 50)
        allObjects.append(toggleWall4)
        
        
        
        
        let blueToggleSwitch1 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch1.position = CGPoint(x: -200, y: 0)
        allObjects.append(blueToggleSwitch1)
        
        let blueToggleSwitch2 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch2.position = CGPoint(x: 0, y: 0)
        allObjects.append(blueToggleSwitch2)
        
        let blueToggleSwitch3 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch3.position = CGPoint(x: 200, y: 0)
        allObjects.append(blueToggleSwitch3)
        
        let grayToggleSwitch = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch.position = CGPoint(x: 0, y: -300)
        allObjects.append(grayToggleSwitch)
        
        
        
        
        let grayWallMiddleLeft = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 10.0, height: 100.0))
        grayWallMiddleLeft.position = CGPoint(x: -500, y: 0.0)
        allObjects.append(grayWallMiddleLeft)
        
        let grayWallMiddleRight = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 10.0, height: 100.0))
        grayWallMiddleRight.position = CGPoint(x: -380, y: 0.0)
        allObjects.append(grayWallMiddleRight)
        
        let grayWallMiddleTop = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 120, height: 10))
        grayWallMiddleTop.position = CGPoint(x: -440, y: 50)
        allObjects.append(grayWallMiddleTop)
        
        let grayWallMiddleBottom = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 120, height: 10))
        grayWallMiddleBottom.position = CGPoint(x: -440, y: -50)
        allObjects.append(grayWallMiddleBottom)
    }
}
