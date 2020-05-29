//
//  LevelThree.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/29/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelThree {
    
    var allObjects = Array<Any>()
    
    init() {
        setupLevel()
    }
    
    func setupLevel() {
        setupBackground()
        
        let leftmost = (UIScreen.main.bounds.height / 2.0) * -1
        let hero = HeroBall()
        hero.position = CGPoint(x: 0 + leftmost, y: 0.0)
        allObjects.append(hero)
        
        let ghost = GhostBall()
        ghost.position = CGPoint(x: 100.0 + leftmost, y: 0.0)
        allObjects.append(ghost)
        
        let blueToggle1 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggle1.position = CGPoint(x: -150.0, y: 0.0)
        allObjects.append(blueToggle1)
        
        let grayToggle = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggle.position = CGPoint(x: 50.0, y: 0.0)
        allObjects.append(grayToggle)
        
        let blueToggle2 = ToggleSwitch(acceptedBallType: .Hero)
        blueToggle2.position = CGPoint(x: 250, y: 0.0)
        allObjects.append(blueToggle2)
        
        let grayToggleWall1 = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 10.0, height: 100.0))
        grayToggleWall1.position = CGPoint(x: 100.0, y: 0.0)
        allObjects.append(grayToggleWall1)
        
        let grayToggleWall2 = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 100.0, height: 10.0))
        grayToggleWall2.position = CGPoint(x: 50.0, y: 50.0)
        allObjects.append(grayToggleWall2)
        
        let grayToggleWall3 = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 100.0, height: 10.0))
        grayToggleWall3.position = CGPoint(x: 50.0, y: -50.0)
        allObjects.append(grayToggleWall3)
        
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
    }
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "mountain.png")
        background.position = CGPoint(x: 0, y: 0)
        background.blendMode = .replace
        background.zPosition = -1
        allObjects.append(background)
    }
}
