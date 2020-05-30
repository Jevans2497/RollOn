//
//  GoalInBox.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/30/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class GoalInBox {
    
    var goalInBoxObjects = Array<Any>()
    
    func makeGoalInBox(goalPosition: CGPoint, acceptedBallType: BallType) -> Array<Any> {
        let goal = Goal()
        goal.position = goalPosition
        goalInBoxObjects.append(goal)
        
        let goalPosX = goalPosition.x
        let goalPosY = goalPosition.y
        
        let toggleWall1 = ToggleWall(acceptedBallType: acceptedBallType, size: CGSize(width: 10, height: 100))
        toggleWall1.position = CGPoint(x: goalPosX - 50, y: goalPosY)
        goalInBoxObjects.append(toggleWall1)
        
        let toggleWall2 = ToggleWall(acceptedBallType: acceptedBallType, size: CGSize(width: 100, height: 10))
        toggleWall2.position = CGPoint(x: goalPosX, y: goalPosY + 50)
        goalInBoxObjects.append(toggleWall2)
        
        let toggleWall3 = ToggleWall(acceptedBallType: acceptedBallType, size: CGSize(width: 10, height: 100))
        toggleWall3.position = CGPoint(x: goalPosX + 50, y: goalPosY)
        goalInBoxObjects.append(toggleWall3)
        
        let toggleWall4 = ToggleWall(acceptedBallType: acceptedBallType, size: CGSize(width: 100, height: 10))
        toggleWall4.position = CGPoint(x: goalPosX, y: goalPosY - 50)
        goalInBoxObjects.append(toggleWall4)
        
        return goalInBoxObjects
    }
}
