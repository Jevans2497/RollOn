//
//  WorldOneLevelThree.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/4/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class WorldOneLevelThree: Level {
    
    override func setupLevel() {
        name = "Level 1-3:\nTwo steps back..."
        
        setupBackground()
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -300, y: 0)
        allObjects.append(hero)
        
        let goalInBox = GoalInBox().makeGoalInBox(goalPosition: CGPoint(x: 300, y: 0), acceptedBallType: .Hero)
        allObjects.append(contentsOf: goalInBox)
        
        let blueToggleSwitch = ToggleSwitch(acceptedBallType: .Hero)
        blueToggleSwitch.position = CGPoint(x: -400, y: 0)
        allObjects.append(blueToggleSwitch)
        
        let youGotThis = TutorialLabel().makeLabel(tutorialString: "I'll let you figure it out from here...")
        youGotThis.position = CGPoint(x: 0, y: 200)
        youGotThis.numberOfLines = 2
        allObjects.append(youGotThis)
    }
}
