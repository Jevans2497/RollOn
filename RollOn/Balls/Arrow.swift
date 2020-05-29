//
//  Arrow.swift
//  RollOn
//
//  Created by Jonathan Evans on 5/24/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class Arrow: SKShapeNode {
    
    var pathToDraw = CGMutablePath()
    var ballLocation = CGPoint(x: 0.0, y: 0.0)
    var touchLocation = CGPoint(x: 0.0, y: 0.0) {
        didSet {
            drawArrow()
        }
    }
    
    override init() {
        super.init()
        name = "arrow"
    }
    
    func drawArrow() {
        pathToDraw = CGMutablePath()
        pathToDraw.move(to: ballLocation)
        pathToDraw.addLine(to: touchLocation)
        drawArrowWings()
        path = pathToDraw
        strokeColor = SKColor.red
        lineWidth = 5.0
        zPosition = 40
    }
    
    func drawArrowWings() {
        let blX = ballLocation.x
        let blY = ballLocation.y
        let tlX = touchLocation.x
        let tlY = touchLocation.y
        let radians = [5.75959, 0.523599] // The left and right wing angle in radians starting from 0 directly to the right and then going counterclockwise (2pi is a full rotation)
        for radian in radians {
            pathToDraw.move(to: ballLocation)
            let angle = atan2(tlY - blY, tlX - blX) + CGFloat(radian)
            let endX = CGFloat(cos(angle) * 50.0) + blX
            let endY = CGFloat(sin(angle) * 50.0) + blY
            pathToDraw.addLine(to: CGPoint(x: endX, y: endY))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
