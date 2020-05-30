//
//  LevelFour.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/29/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelFour: Level {
    
    override func setupLevel() {
        setupBackground(imageName: "mountain.jpg")
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -400, y: 0.0)
        allObjects.append(hero)
        
        let bomb1 = BombBall()
        bomb1.position = CGPoint(x: -100, y: 100)
        allObjects.append(bomb1)
        
        let bomb2 = BombBall()
        bomb2.position = CGPoint(x: 0, y: 100)
        allObjects.append(bomb2)
        
        let bomb3 = BombBall()
        bomb3.position = CGPoint(x: 100, y: 100)
        allObjects.append(bomb3)
        
        let bomb4 = BombBall()
        bomb4.position = CGPoint(x: -100, y: 0)
        allObjects.append(bomb4)
        
        let bomb5 = BombBall()
        bomb5.position = CGPoint(x: 0, y: 0)
        allObjects.append(bomb5)
        
        let bomb6 = BombBall()
        bomb6.position = CGPoint(x: 100, y: 0)
        allObjects.append(bomb6)
        
        let bomb7 = BombBall()
        bomb7.position = CGPoint(x: -100, y: -100)
        allObjects.append(bomb7)
        
        let bomb8 = BombBall()
        bomb8.position = CGPoint(x: 0, y: -100)
        allObjects.append(bomb8)
        
        let bomb9 = BombBall()
        bomb9.position = CGPoint(x: 100, y: -100)
        allObjects.append(bomb9)
        
        let wall = Wall(size: CGSize(width: 10.0, height: 100.0))
        wall.position = CGPoint(x: -350.0, y: 0.0)
        allObjects.append(wall)
        
        let redToggleWall = ToggleWall(acceptedBallType: .Bomb, size: CGSize(width: 10.0, height: 100.0))
        redToggleWall.position = CGPoint(x: -450, y: 0)
        allObjects.append(redToggleWall)
        
        let redToggleWall2 = ToggleWall(acceptedBallType: .Bomb, size: CGSize(width: 100.0, height: 10.0))
        redToggleWall2.position = CGPoint(x: -400.0, y: 50.0)
        allObjects.append(redToggleWall2)
        
        let redToggleWall3 = ToggleWall(acceptedBallType: .Bomb, size: CGSize(width: 100.0, height: 10.0))
        redToggleWall3.position = CGPoint(x: -400.0, y: -50)
        allObjects.append(redToggleWall3)
        
        let redToggleSwitch = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch.position = CGPoint(x: -300.0, y: 0.0)
        allObjects.append(redToggleSwitch)
    }
}
