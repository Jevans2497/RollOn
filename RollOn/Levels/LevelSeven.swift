//
//  LevelSeven.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/30/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelSeven: Level {
    
    override func setupLevel() {
        let leftmost = (UIScreen.main.bounds.height / 2.0) * -1
        let rightmost = (UIScreen.main.bounds.height / 2.0)
        
        setupBackground(imageName: "mountain")
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -400, y: 0.0)
        allObjects.append(hero)
        
        let ghostBallTopLeft = GhostBall()
        ghostBallTopLeft.position = CGPoint(x: -400, y: 250)
        allObjects.append(ghostBallTopLeft)
        
        let ghostBallTopRight = GhostBall()
        ghostBallTopRight.position = CGPoint(x: 400, y: 250)
        allObjects.append(ghostBallTopRight)
        
        let ghostBallBottomLeft = GhostBall()
        ghostBallBottomLeft.position = CGPoint(x: -30, y: -320)
        allObjects.append(ghostBallBottomLeft)
        
        let ghostBallBottomRight = GhostBall()
        ghostBallBottomRight.position = CGPoint(x: 30, y: -320)
        allObjects.append(ghostBallBottomRight)
        
        let bombBallTopLeft = BombBall()
        bombBallTopLeft.position = CGPoint(x: -100, y: 300)
        allObjects.append(bombBallTopLeft)
        
        let bombBallTopRight = BombBall()
        bombBallTopRight.position = CGPoint(x: 100, y: 300)
        allObjects.append(bombBallTopRight)
        
        let bombBallBottomLeft = BombBall()
        bombBallBottomLeft.position = CGPoint(x: -300, y: -300)
        allObjects.append(bombBallBottomLeft)
        
        let bombBallBottomRight = BombBall()
        bombBallBottomRight.position = CGPoint(x: 300, y: -300)
        allObjects.append(bombBallBottomRight)
        
        
        
        let goal = Goal()
        goal.position = CGPoint(x: 450.0, y: 0.0)
        allObjects.append(goal)
        
        
        
        let grayToggleSwitch1 = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch1.position = CGPoint(x: -300.0, y: 0.0)
        allObjects.append(grayToggleSwitch1)
        
        let grayToggleSwitch2 = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch2.position = CGPoint(x: -100.0, y: 0.0)
        allObjects.append(grayToggleSwitch2)
        
        let grayToggleSwitch3 = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch3.position = CGPoint(x: 100.0, y: 0.0)
        allObjects.append(grayToggleSwitch3)
        
        let grayToggleSwitch4 = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch4.position = CGPoint(x: 300.0, y: 0.0)
        allObjects.append(grayToggleSwitch4)
        
        let grayToggleWall1 = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 10.0, height: 100))
        grayToggleWall1.position = CGPoint(x: -360.0, y: 0.0)
        allObjects.append(grayToggleWall1)
        
        let grayToggleWall2 = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 10.0, height: 100))
        grayToggleWall2.position = CGPoint(x: -200, y: 0.0)
        allObjects.append(grayToggleWall2)
        
        let grayToggleWall3 = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 10.0, height: 100))
        grayToggleWall3.position = CGPoint(x: 0, y: 0.0)
        allObjects.append(grayToggleWall3)
        
        let grayToggleWall4 = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 10.0, height: 100))
        grayToggleWall4.position = CGPoint(x: 200, y: 0.0)
        allObjects.append(grayToggleWall4)
        
        
        
        
        
        let bouncer = Bouncer(size: CGSize(width: 70, height: 70), bounceDirection: .right)
        bouncer.position = CGPoint(x: -470, y: 0.0)
        allObjects.append(bouncer)
        
        
        let wall1 = Wall(size: CGSize(width: 1200, height: 10.0))
        wall1.position = CGPoint(x: 0, y: 50.0)
        allObjects.append(wall1)
        
        let wall2 = Wall(size: CGSize(width: 1200, height: 10.0))
        wall2.position = CGPoint(x: 0, y: -50.0)
        allObjects.append(wall2)
        
        
        
        
        let ghostWallTopLeft = GhostWall(size: CGSize(width: 480, height: 30.0))
        ghostWallTopLeft.position = CGPoint(x: leftmost + 30, y: 60.0)
        allObjects.append(ghostWallTopLeft)
        
        let ghostWallTopMiddle = GhostWall(size: CGSize(width: 60, height: 30.0))
        ghostWallTopMiddle.position = CGPoint(x: 0, y: 60.0)
        allObjects.append(ghostWallTopMiddle)
        
        let ghostWallTopRight = GhostWall(size: CGSize(width: 480, height: 30.0))
        ghostWallTopRight.position = CGPoint(x: rightmost - 30, y: 60.0)
        allObjects.append(ghostWallTopRight)
        
        let ghostWallTopLeftEdge = GhostWall(size: CGSize(width: 30.0, height: 90.0))
        ghostWallTopLeftEdge.position = CGPoint(x: -160, y: 90.0)
        allObjects.append(ghostWallTopLeftEdge)
        
        let ghostWallTopMiddleLeftEdge = GhostWall(size: CGSize(width: 30.0, height: 90.0))
        ghostWallTopMiddleLeftEdge.position = CGPoint(x: -40, y: 90.0)
        allObjects.append(ghostWallTopMiddleLeftEdge)
        
        let ghostWallTopMiddleRightEdge = GhostWall(size: CGSize(width: 30.0, height: 90.0))
        ghostWallTopMiddleRightEdge.position = CGPoint(x: 40, y: 90.0)
        allObjects.append(ghostWallTopMiddleRightEdge)
        
        let ghostWallTopRightEdge = GhostWall(size: CGSize(width: 30.0, height: 90.0))
        ghostWallTopRightEdge.position = CGPoint(x: 160, y: 90.0)
        allObjects.append(ghostWallTopRightEdge)
        
        
        
        
        let ghostWallBottomLeft = GhostWall(size: CGSize(width: 180, height: 30.0))
        ghostWallBottomLeft.position = CGPoint(x: leftmost - 30, y: -60.0)
        allObjects.append(ghostWallBottomLeft)
        
        let ghostWallBottomMiddle = GhostWall(size: CGSize(width: 470, height: 30.0))
        ghostWallBottomMiddle.position = CGPoint(x: 0, y: -60.0)
        allObjects.append(ghostWallBottomMiddle)
        
        let ghostWallBottomRight = GhostWall(size: CGSize(width: 180, height: 30.0))
        ghostWallBottomRight.position = CGPoint(x: rightmost + 30, y: -60.0)
        allObjects.append(ghostWallBottomRight)
        
        let ghostWallBottomLeftEdge = GhostWall(size: CGSize(width: 30.0, height: 90.0))
        ghostWallBottomLeftEdge.position = CGPoint(x: -360, y: -90.0)
        allObjects.append(ghostWallBottomLeftEdge)
        
        let ghostWallBottomMiddleLeftEdge = GhostWall(size: CGSize(width: 30.0, height: 90.0))
        ghostWallBottomMiddleLeftEdge.position = CGPoint(x: -240, y: -90.0)
        allObjects.append(ghostWallBottomMiddleLeftEdge)
        
        let ghostWallBottomMiddleRightEdge = GhostWall(size: CGSize(width: 30.0, height: 90.0))
        ghostWallBottomMiddleRightEdge.position = CGPoint(x: 240, y: -90.0)
        allObjects.append(ghostWallBottomMiddleRightEdge)
        
        let ghostWallBottomRightEdge = GhostWall(size: CGSize(width: 30.0, height: 90.0))
        ghostWallBottomRightEdge.position = CGPoint(x: 360, y: -90.0)
        allObjects.append(ghostWallBottomRightEdge)
    }
}
