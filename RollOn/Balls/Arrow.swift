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
        pathToDraw.move(to: adjustedTip())
        pathToDraw.addLine(to: touchLocation)
        drawArrowWings()
        path = pathToDraw
        strokeColor = SKColor.red
        lineWidth = 5.0
        zPosition = 40
    }
    
    func drawArrowWings() {
        let radians = [5.75959, 0.523599] // The left and right wing angle in radians starting from 0 directly to the right and then going counterclockwise (2pi is a full rotation)
        for radian in radians {
            let angle = ballLocationToTouchLocationInRadians() + CGFloat(radian)
            let endX = CGFloat(cos(angle) * 65.0) + ballLocation.x
            let endY = CGFloat(sin(angle) * 65.0) + ballLocation.y
            pathToDraw.move(to: adjustedTip())
            pathToDraw.addLine(to: CGPoint(x: endX, y: endY))
        }
    }
    
    //Without adjustment, the arrow tip is in the center of the ball. This puts it on the edge instead
    private func adjustedTip() -> CGPoint {
        let angle = ballLocationToTouchLocationInRadians()
        let adjustedX = CGFloat(cos(angle) * 23.0) + ballLocation.x
        let adjustedY = CGFloat(sin(angle) * 23.0) + ballLocation.y
        return CGPoint(x: adjustedX, y: adjustedY)
    }
    
    private func ballLocationToTouchLocationInRadians() -> CGFloat {
        let blX = ballLocation.x
        let blY = ballLocation.y
        let tlX = touchLocation.x
        let tlY = touchLocation.y
        return atan2(tlY - blY, tlX - blX)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
