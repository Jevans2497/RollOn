//
//  LevelManager.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/2/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class LevelManager {
    
    var levels: [Level] = []
    var currentLevel = 0
    
    init() {
        makeLevels()
    }
    
    func makeLevels() {
        levels.append(LevelOne())
        levels.append(LevelTwo())
        levels.append(LevelThree())
        levels.append(LevelFour())
        levels.append(LevelFive())
        levels.append(LevelSix())
        levels.append(LevelSeven())
        levels.append(LevelEight())
        levels.append(LevelNine())
        levels.append(LevelTen())
    }
    
    func getCurrentLevel() -> Level {
        return levels[currentLevel]
    }
    
    func nextLevel() -> Level {
        currentLevel += 1
        return currentLevel < levels.count ? levels[currentLevel] : levels[levels.count - 1]
    }
}
