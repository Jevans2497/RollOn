//
//  ToggleSwitchManager.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class ToggleSwitchCounter {
    
    var toggleSwitchCounter: Dictionary<BallType, Int>
    
    init() {
        toggleSwitchCounter = Dictionary<BallType, Int>()
    }
    
    //If nil, set it to 1, otherwise increment
    func increment(ballType: BallType) {
        if toggleSwitchCounter[ballType] == nil { toggleSwitchCounter[ballType] = 1
        } else {
            toggleSwitchCounter[ballType]! += 1
        }
    }
    
    func decrement(ballType: BallType) {
        if toggleSwitchCounter[ballType] == nil { toggleSwitchCounter[ballType] = 1
        } else {
            toggleSwitchCounter[ballType]! -= 1
        }
    }
    
    func getValue(for ballType: BallType) -> Int {
        return toggleSwitchCounter[ballType] ?? 1
    }
    
    func reset() {
        for key in toggleSwitchCounter.keys {
            toggleSwitchCounter[key] = 0
        }
    }
}
