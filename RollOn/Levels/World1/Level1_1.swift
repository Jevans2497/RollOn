//
//  WorldOneLevelOne.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/4/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Level1_1: Level {
    
    override func setupLevel() {
        name = "Level 1-1:\nBaby Steps"
        
        setupBackground()
        
        let hero = HeroBall()
        hero.position = CGPoint(x: -300, y: 0)
        allObjects.append(hero)
        
        let goal = Goal()
        goal.position = CGPoint(x: 300, y: 0)
        allObjects.append(goal)
        
        let step1 = TutorialLabel().makeLabel(tutorialString: "Step 1.\nTouch the ball")
        step1.position = CGPoint(x: -300, y: -150)
        step1.numberOfLines = 2
        allObjects.append(step1)
        
        let step2 = TutorialLabel().makeLabel(tutorialString: "Step 2.\nDrag and release")
        step2.position = CGPoint(x: 0, y: -150)
        step2.numberOfLines = 2
        allObjects.append(step2)
        
        let step3 = TutorialLabel().makeLabel(tutorialString: "Step 3.\nClick start")
        step3.position = CGPoint(x: 300, y: -150)
        step3.numberOfLines = 2
        allObjects.append(step3)
        
        let guideArrow = Arrow(arrowColor: .black)
        guideArrow.ballLocation = hero.position
        guideArrow.touchLocation = CGPoint(x: -450, y: 0)
        guideArrow.alpha = 0.4
        allObjects.append(guideArrow)
    }
}
