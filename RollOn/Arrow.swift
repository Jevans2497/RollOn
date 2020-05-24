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
        drawLeftArrowWing()
        drawRightArrowWing()
        path = pathToDraw
        strokeColor = SKColor.red
        lineWidth = 5.0
    }
    
    func drawWings() {
        pathToDraw.move(to: ballLocation)
        let blX = ballLocation.x
        let blY = ballLocation.y
        let tlX = touchLocation.x
        let tlY = touchLocation.y
        let angles = [5.75959, 0.523599]
        let angle = atan2(tlY - blY, tlX - blX) + 5.75959
        let endX = CGFloat(cos(angle) * 50.0) + blX
        let endY = CGFloat(sin(angle) * 50.0) + blY
        pathToDraw.addLine(to: CGPoint(x: endX, y: endY))
    }
    
    func drawLeftArrowWing() {
        pathToDraw.move(to: ballLocation)
        let blX = ballLocation.x
        let blY = ballLocation.y
        let tlX = touchLocation.x
        let tlY = touchLocation.y
        let angle = atan2(tlY - blY, tlX - blX) + 5.75959
        let endX = CGFloat(cos(angle) * 50.0) + blX
        let endY = CGFloat(sin(angle) * 50.0) + blY
        pathToDraw.addLine(to: CGPoint(x: endX, y: endY))
    }
    
    func drawRightArrowWing() {
        pathToDraw.move(to: ballLocation)
        let blX = ballLocation.x
        let blY = ballLocation.y
        let tlX = touchLocation.x
        let tlY = touchLocation.y
        let angle = atan2(tlY - blY, tlX - blX) + 0.523599
        let endX = CGFloat(cos(angle) * 50.0) + blX
        let endY = CGFloat(sin(angle) * 50.0) + blY
        pathToDraw.addLine(to: CGPoint(x: endX, y: endY))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
