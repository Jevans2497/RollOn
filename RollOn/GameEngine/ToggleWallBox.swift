//
//  ToggleWallBox.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/25/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class ToggleWallBox {
    
    init(center: CGPoint, ballType: BallType) {
        let toggleWallLeft = ToggleWall(acceptedBallType: ballType, size: CGSize(width: 10.0, height: 100.0))
        let toggleWallTop = ToggleWall(acceptedBallType: ballType, size: CGSize(width: 100.0, height: 10.0))
        let toggleWallRight = ToggleWall(acceptedBallType: ballType, size: CGSize(width: 10.0, height: 100.0))
        let toggleWallBottom = ToggleWall(acceptedBallType: ballType, size: CGSize(width: 100.0, height: 10.0))
        toggleWallLeft.position = CGPoint(x: center.x - 50.0, y: center.y)
    }
}
