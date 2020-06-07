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
//        makeWorldOne()
        makeWorldTwo()
//        makeOriginalLevels()
    }
    
    func makeWorldOne() {
//        levels.append(Level1_1())
//        levels.append(Level1_2())
//        levels.append(Level1_3())
//        levels.append(Level1_4())
//        levels.append(Level1_5())
        levels.append(Level1_6())
    }
    
    func makeWorldTwo() {
        levels.append(Level2_1())
    }
    
    func makeOriginalLevels() {
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
