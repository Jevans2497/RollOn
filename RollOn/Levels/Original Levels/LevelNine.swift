//
//  LevelNine.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/1/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelNine: Level {
    
    override func setupLevel() {
        name = "Level 9: The Ol' Union Jack"
        
        setupBackground(imageName: "mountain.jpg")
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -350, y: 0.0)
        allObjects.append(hero)
        
        let heroBomb = BombBall()
        heroBomb.position = CGPoint(x: -450.0, y: 0.0)
        allObjects.append(heroBomb)
        
        
        
        let goalInBox = GoalInBox().makeGoalInBox(goalPosition: CGPoint(x: 400.0, y: 0.0), acceptedBallType: .Bomb)
        allObjects.append(contentsOf: goalInBox)
        
        
        
        let centerWallLeftTop = Wall(size: CGSize(width: 350.0, height: 10.0))
        centerWallLeftTop.position = CGPoint(x: -400, y: 50)
        allObjects.append(centerWallLeftTop)
        
        let centerWallLeftBottom = Wall(size: CGSize(width: 350.0, height: 10.0))
        centerWallLeftBottom.position = CGPoint(x: -400, y: -50)
        allObjects.append(centerWallLeftBottom)
        
        let centerWallRightTop = Wall(size: CGSize(width: 350.0, height: 10.0))
        centerWallRightTop.position = CGPoint(x: 400, y: 50)
        allObjects.append(centerWallRightTop)
        
        let centerWallRightBottom = Wall(size: CGSize(width: 350.0, height: 10.0))
        centerWallRightBottom.position = CGPoint(x: 400, y: -50)
        allObjects.append(centerWallRightBottom)
        
        
        
        
        //Format for variable names is objectType - top/bottom on screen - left/right/middle on half - left/right/middle in section
        let wallTopMiddleLeft = Wall(size: CGSize(width: 10.0, height: 255))
        wallTopMiddleLeft.position = CGPoint(x: -80, y: 290)
        allObjects.append(wallTopMiddleLeft)
        
        let wallTopMiddleMiddle = Wall(size: CGSize(width: 10.0, height: 200))
        wallTopMiddleMiddle.position = CGPoint(x: 0, y: 290)
        allObjects.append(wallTopMiddleMiddle)
        
        let wallTopMiddleRight = Wall(size: CGSize(width: 10.0, height: 255))
        wallTopMiddleRight.position = CGPoint(x: 80, y: 290)
        allObjects.append(wallTopMiddleRight)
        
        let bombBallTopMiddle = BombBall()
        bombBallTopMiddle.position = CGPoint(x: -40, y: 240.0)
        allObjects.append(bombBallTopMiddle)
        
        let redToggleTopMiddle = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleTopMiddle.position = CGPoint(x: 40.0, y: 240)
        allObjects.append(redToggleTopMiddle)
        
        
        
        
        
        
        let wallBottomMiddleLeft = Wall(size: CGSize(width: 10.0, height: 255))
        wallBottomMiddleLeft.position = CGPoint(x: -80, y: -290)
        allObjects.append(wallBottomMiddleLeft)
        
        let wallBottomMiddleMiddle = Wall(size: CGSize(width: 10.0, height: 200))
        wallBottomMiddleMiddle.position = CGPoint(x: 0, y: -290)
        allObjects.append(wallBottomMiddleMiddle)
        
        let wallBottomMiddleRight = Wall(size: CGSize(width: 10.0, height: 255))
        wallBottomMiddleRight.position = CGPoint(x: 80, y: -290)
        allObjects.append(wallBottomMiddleRight)
        
        let bombBallBottomMiddle = BombBall()
        bombBallBottomMiddle.position = CGPoint(x: 40, y: -260.0)
        allObjects.append(bombBallBottomMiddle)
        
        let redToggleBottomMiddle = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleBottomMiddle.position = CGPoint(x: -40.0, y: -260.0)
        allObjects.append(redToggleBottomMiddle)
        
        
        
        
        
        let wallTopLeftLeft = Wall(size: CGSize(width: 10.0, height: 500))
        wallTopLeftLeft.position = CGPoint(x: -460, y: 230)
        wallTopLeftLeft.zRotation = 0.93
        allObjects.append(wallTopLeftLeft)
        
        let wallTopLeftMiddle = Wall(size: CGSize(width: 10.0, height: 620))
        wallTopLeftMiddle.position = CGPoint(x: -340, y: 253)
        wallTopLeftMiddle.zRotation = 0.93
        allObjects.append(wallTopLeftMiddle)
        
        let wallTopLeftRight = Wall(size: CGSize(width: 10.0, height: 460.0))
        wallTopLeftRight.position = CGPoint(x: -260, y: 295)
        wallTopLeftRight.zRotation = 0.93
        allObjects.append(wallTopLeftRight)
        
        let bombBallTopLeft = BombBall()
        bombBallTopLeft.position = CGPoint(x: -400, y: 241)
        allObjects.append(bombBallTopLeft)
        
        let redToggleTopLeft = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleTopLeft.position = CGPoint(x: -300, y: 270.0)
        allObjects.append(redToggleTopLeft)
        
        
        
        
        let wallTopRightRight = Wall(size: CGSize(width: 10.0, height: 500))
        wallTopRightRight.position = CGPoint(x: 460, y: 230)
        wallTopRightRight.zRotation = 5.3529248
        allObjects.append(wallTopRightRight)
        
        let wallTopRightMiddle = Wall(size: CGSize(width: 10.0, height: 620))
        wallTopRightMiddle.position = CGPoint(x: 340, y: 253)
        wallTopRightMiddle.zRotation = 5.3529248
        allObjects.append(wallTopRightMiddle)
        
        let wallTopRightLeft = Wall(size: CGSize(width: 10.0, height: 460.0))
        wallTopRightLeft.position = CGPoint(x: 260, y: 295)
        wallTopRightLeft.zRotation = 5.3529248
        allObjects.append(wallTopRightLeft)
        
        let bombBallTopRight = BombBall()
        bombBallTopRight.position = CGPoint(x: 400, y: 241)
        allObjects.append(bombBallTopRight)
        
        let redToggleTopRight = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleTopRight.position = CGPoint(x: 300, y: 270.0)
        allObjects.append(redToggleTopRight)
        
        
        
        
        
        let wallBottomRightRight = Wall(size: CGSize(width: 10.0, height: 500))
        wallBottomRightRight.position = CGPoint(x: 460, y: -230)
        wallBottomRightRight.zRotation = 0.93
        allObjects.append(wallBottomRightRight)
        
        let wallBottomRightMiddle = Wall(size: CGSize(width: 10.0, height: 620))
        wallBottomRightMiddle.position = CGPoint(x: 340, y: -253)
        wallBottomRightMiddle.zRotation = 0.93
        allObjects.append(wallBottomRightMiddle)
        
        let wallBottomRightLeft = Wall(size: CGSize(width: 10.0, height: 460.0))
        wallBottomRightLeft.position = CGPoint(x: 260, y: -295)
        wallBottomRightLeft.zRotation = 0.93
        allObjects.append(wallBottomRightLeft)
        
        let bombBallBottomRight = BombBall()
        bombBallBottomRight.position = CGPoint(x: 400, y: -241)
        allObjects.append(bombBallBottomRight)
        
        let redToggleBottomRight = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleBottomRight.position = CGPoint(x: 300, y: -270.0)
        allObjects.append(redToggleBottomRight)
        
        
        
        
        
        let wallBottomLeftLeft = Wall(size: CGSize(width: 10.0, height: 500))
        wallBottomLeftLeft.position = CGPoint(x: -460, y: -230)
        wallBottomLeftLeft.zRotation = 5.3529248
        allObjects.append(wallBottomLeftLeft)
        
        let wallBottomLeftMiddle = Wall(size: CGSize(width: 10.0, height: 620))
        wallBottomLeftMiddle.position = CGPoint(x: -340, y: -253)
        wallBottomLeftMiddle.zRotation = 5.3529248
        allObjects.append(wallBottomLeftMiddle)
        
        let wallBottomLeftRight = Wall(size: CGSize(width: 10.0, height: 460.0))
        wallBottomLeftRight.position = CGPoint(x: -260, y: -295)
        wallBottomLeftRight.zRotation = 5.3529248
        allObjects.append(wallBottomLeftRight)
        
        let bombBallBottomLeft = BombBall()
        bombBallBottomLeft.position = CGPoint(x: -400, y: -241)
        allObjects.append(bombBallBottomLeft)
        
        let redToggleBottomLeft = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleBottomLeft.position = CGPoint(x: -300, y: -270.0)
        allObjects.append(redToggleBottomLeft)
        
        
    }
}
