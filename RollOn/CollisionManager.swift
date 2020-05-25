//
//  CollisionManager.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class CollisionManager {
    
    var nodeA: SKNode
    var nodeB: SKNode
    
    init(nodeA: SKNode, nodeB: SKNode) {
        self.nodeA = nodeA
        self.nodeB = nodeB
    }
    
    func handleCollision() {
        if let nodeAIsBall = nodeA.name?.contains("ball"), let nodeBIsBall = nodeB.name?.contains("ball") {
            //Because the contact test masks are set not to detect ball to ball collisions, we don't need to check for it
            if nodeAIsBall {
                collisionOccured(ball: nodeA as! Ball, otherObject: nodeB)
            } else if nodeBIsBall {
                collisionOccured(ball: nodeB as! Ball, otherObject: nodeA)
            }
        }
    }
    
    func collisionOccured(ball: Ball, otherObject: SKNode) {
        if otherObject.name == "goal" {
            goalCollision(ball: ball)
        } else if let _ = otherObject.name?.contains("toggleSwitch") {
            toggleSwitchCollision(toggleSwitch: otherObject as! ToggleSwitch)
        }
    }
    
    func goalCollision(ball: Ball) {
        ball.inGoal()
    }
    
    func toggleSwitchCollision(toggleSwitch: ToggleSwitch) {
        toggleSwitch.toggle()
    }
}
