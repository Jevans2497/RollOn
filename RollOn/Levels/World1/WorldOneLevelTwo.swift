//
//  WorldOneLevelTwo.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/4/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class WorldOneLevelTwo: Level {
    
    override func setupLevel() {
        name = "Level 1-2: It's Rewind Time"
        setupBackground(imageName: "mountain.jpg")
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -300, y: 0)
        allObjects.append(hero)
        
        let goal = Goal()
        goal.position = CGPoint(x: 300, y: 0)
        allObjects.append(goal)
        
        let wall = Wall(size: CGSize(width: 20.0, height: 100.0))
        wall.position = CGPoint(x: -200, y: 0)
        allObjects.append(wall)
        
        let resetTutorial = TutorialLabel().makeLabel(tutorialString: "Missed the goal?\nJust click reset")
        resetTutorial.position = CGPoint(x: 0, y: 250)
        resetTutorial.numberOfLines = 2
        allObjects.append(resetTutorial)
    }
}
