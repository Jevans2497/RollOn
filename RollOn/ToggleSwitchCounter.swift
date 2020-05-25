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
        toggleSwitchCounter[ballType] = toggleSwitchCounter[ballType] == nil ? 1 : +1
    }
    
    func decrement(ballType: BallType) {
        toggleSwitchCounter[ballType] = toggleSwitchCounter[ballType] == nil ? 0 : -1
    }
}
