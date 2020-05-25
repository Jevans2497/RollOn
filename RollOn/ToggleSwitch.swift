//
//  ToggleSwitch.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class ToggleSwitch : SKShapeNode {
    
  convenience init(color: UIColor) {
    self.init()
    self.init(circleOfRadius: 50.0)
    
    
    fillColor = color
  }
}
