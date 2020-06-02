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
        name = "Level: Think Again"
        
        setupBackground(imageName: "mountain.jpg")
        
        let goal = Goal()
        goal.position = CGPoint(x: 400, y: 0)
        allObjects.append(goal)
        
        let hero = HeroBall()
        hero.position = CGPoint(x: 0, y: 0)
        allObjects.append(hero)
        
        let bombBall1 = BombBall()
        bombBall1.position = CGPoint(x: -400, y: 250)
        allObjects.append(bombBall1)
        
        let bombBall2 = BombBall()
        bombBall2.position = CGPoint(x: -400, y: 125)
        allObjects.append(bombBall2)
        
        let bombBall3 = BombBall()
        bombBall3.position = CGPoint(x: -400, y: 0)
        allObjects.append(bombBall3)
        
        let bombBall4 = BombBall()
        bombBall4.position = CGPoint(x: -400, y: -125)
        allObjects.append(bombBall4)
        
        let bombBall5 = BombBall()
        bombBall5.position = CGPoint(x: -400, y: -250)
        allObjects.append(bombBall5)
        
        let ghostBall1 = GhostBall()
        ghostBall1.position = CGPoint(x: 0, y: 250)
        allObjects.append(ghostBall1)
        
        let ghostBall2 = GhostBall()
        ghostBall2.position = CGPoint(x: 0, y: 125)
        allObjects.append(ghostBall2)
        
        let ghostBall4 = GhostBall()
        ghostBall4.position = CGPoint(x: 0, y: -125)
        allObjects.append(ghostBall4)
        
        let ghostBall5 = GhostBall()
        ghostBall5.position = CGPoint(x: 0, y: -250)
        allObjects.append(ghostBall5)
        
        
        
        
        
        let spikes1 = Spikes(size: CGSize(width: 30, height: 500))
        spikes1.position = CGPoint(x: -40, y: 200)
        allObjects.append(spikes1)
        
        let spikes2 = Spikes(size: CGSize(width: 30, height: 500))
        spikes2.position = CGPoint(x: -40, y: -200)
        allObjects.append(spikes2)
        
        let redToggleWall = ToggleWall(acceptedBallType: .Bomb, size: CGSize(width: 10, height: 1000))
        redToggleWall.position = CGPoint(x: 150, y: 0)
        allObjects.append(redToggleWall)
        
        let grayToggleWall = ToggleWall(acceptedBallType: .Ghost, size: CGSize(width: 10, height: 1000))
        grayToggleWall.position = CGPoint(x: 300, y: 0)
        allObjects.append(grayToggleWall)
        
        
        
        let redToggleSwitch1 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch1.position = CGPoint(x: -90, y: 250)
        allObjects.append(redToggleSwitch1)
        
        let redToggleSwitch2 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch2.position = CGPoint(x: -90, y: 125)
        allObjects.append(redToggleSwitch2)
        
        let redToggleSwitch3 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch3.position = CGPoint(x: -90, y: 0)
        allObjects.append(redToggleSwitch3)
        
        let redToggleSwitch4 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch4.position = CGPoint(x: -90, y: -125)
        allObjects.append(redToggleSwitch4)
        
        let redToggleSwitch5 = ToggleSwitch(acceptedBallType: .Bomb)
        redToggleSwitch5.position = CGPoint(x: -90, y: -250)
        allObjects.append(redToggleSwitch5)
        
        let grayToggleSwitch1 = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch1.position = CGPoint(x: 225, y: 250)
        allObjects.append(grayToggleSwitch1)
        
        let grayToggleSwitch2 = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch2.position = CGPoint(x: 225, y: 125)
        allObjects.append(grayToggleSwitch2)
        
        let grayToggleSwitch3 = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch3.position = CGPoint(x: 225, y: 0)
        allObjects.append(grayToggleSwitch3)
        
        let grayToggleSwitch4 = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch4.position = CGPoint(x: 225, y: -125)
        allObjects.append(grayToggleSwitch4)
        
        let grayToggleSwitch5 = ToggleSwitch(acceptedBallType: .Ghost)
        grayToggleSwitch5.position = CGPoint(x: 225, y: -250)
        allObjects.append(grayToggleSwitch5)
    }
}
