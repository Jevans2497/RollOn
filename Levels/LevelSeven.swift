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
        setupBackground(imageName: "mountain")
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -400, y: 0.0)
        allObjects.append(hero)
        
        let ghostBallTopLeft = GhostBall()
        ghostBallTopLeft.position = CGPoint(x: -400, y: 300)
        allObjects.append(ghostBallTopLeft)
        
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
        
        
        
        let bouncer = Bouncer(size: CGSize(width: 70, height: 70), bounceDirection: .right)
        bouncer.position = CGPoint(x: -470, y: 0.0)
        allObjects.append(bouncer)
        
        let grayToggleWall = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 10.0, height: 100))
        grayToggleWall.position = CGPoint(x: -360.0, y: 0.0)
        allObjects.append(grayToggleWall)
        
        let wall1 = Wall(size: CGSize(width: 1200, height: 10.0))
        wall1.position = CGPoint(x: 0, y: 50.0)
        allObjects.append(wall1)
        
        let wall2 = Wall(size: CGSize(width: 1200, height: 10.0))
        wall2.position = CGPoint(x: 0, y: -50.0)
        allObjects.append(wall2)
        
        let ghostWallTopLeft = GhostWall(size: CGSize(width: 480, height: 30.0))
        ghostWallTopLeft.position = CGPoint(x: leftmost + 30, y: 60.0)
        allObjects.append(ghostWallTopLeft)
        
        let ghostWallTopLeftEdge = GhostWall(size: CGSize(width: 30.0, height: 90.0))
        ghostWallTopLeftEdge.position = CGPoint(x: -160, y: 90.0)
        allObjects.append(ghostWallTopLeftEdge)
    }
}
