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
    
    var toggleSwitchCounter = ToggleSwitchCounter()
    weak var toggleSwitchCounterDelegate: ToggleSwitchCounterDelegate?
    weak var goalReachedDelegate: GoalReachedDelegate?
    
    init() {}
    
    func handleCollision(nodeA: SKNode, nodeB: SKNode) {
        if let nodeAIsBall = nodeA.name?.contains("ball"), let nodeBIsBall = nodeB.name?.contains("ball") {
            if nodeAIsBall && nodeBIsBall {
                ballToBallCollisionOccured(ball1: nodeA as! Ball, ball2: nodeB as! Ball)
            } else if nodeAIsBall {
                collisionOccured(ball: nodeA as! Ball, otherObject: nodeB)
            } else if nodeBIsBall {
                collisionOccured(ball: nodeB as! Ball, otherObject: nodeA)
            }
        }
    }
    
    func ballToBallCollisionOccured(ball1: Ball, ball2: Ball) {
        let ball1BallType = ball1.ballType
        let ball2BallType = ball2.ballType
        if ball1BallType == .Ghost || ball2BallType == .Ghost {
            ghostBallCollision(ball1: ball1, ball2: ball2)
        }
    }
    
    func collisionOccured(ball: Ball, otherObject: SKNode) {
        switch otherObject.name {
        case "goal":
            goalCollision(ball: ball)
        case "toggleSwitch":
            toggleSwitchCollision(ball: ball, toggleSwitch: otherObject as! ToggleSwitch)
        case "spikes":
            spikesCollision(ball: ball)
        case "bouncer":
            bouncerCollision(bouncer: otherObject as! Bouncer, ball: ball)
        default:
            print("Collision occured of unknown type")
        }
    }
    
    func ghostBallCollision(ball1: Ball, ball2: Ball) {
        if ball1.ballType == .Ghost && ball2.ballType != .Ghost {
            ball2.ghostBallCollision()
        } else if ball1.ballType != .Ghost && ball2.ballType == .Ghost {
            ball1.ghostBallCollision()
        }
    }
    
    func goalCollision(ball: Ball) {
        ball.inGoal()
        goalReachedDelegate?.goalReached()
    }
    
    func toggleSwitchCollision(ball: Ball, toggleSwitch: ToggleSwitch) {
        if ball.ballType == toggleSwitch.acceptedBallType {
            if !toggleSwitch.hasBeenToggled {
                toggleSwitch.toggle()
                toggleSwitchCounter.decrement(ballType: toggleSwitch.acceptedBallType)
                if toggleSwitchCounter.getValue(for: toggleSwitch.acceptedBallType) <= 0 {
                    toggleCounterHitZero(toggleSwitch: toggleSwitch)
                }
            }
        }
    }
    
    func toggleCounterHitZero(toggleSwitch: ToggleSwitch) {
        toggleSwitchCounterDelegate?.toggleCounterHitZero(for: toggleSwitch.acceptedBallType)
    }
    
    func resetToggleCounter() {
        toggleSwitchCounter.reset()
    }
    
    func spikesCollision(ball: Ball) {
        ball.destroy()
    }
    
    func bouncerCollision(bouncer: Bouncer, ball: Ball) {
        bouncer.bounce(ball: ball)
    }
}

protocol ToggleSwitchCounterDelegate: class {
    func toggleCounterHitZero(for ballType: BallType)
}

protocol GoalReachedDelegate: class {
    func goalReached()
}
