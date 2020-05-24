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
        let pathToDraw = CGMutablePath()
        pathToDraw.move(to: ballLocation)
        pathToDraw.addLine(to: touchLocation)
        path = pathToDraw
        strokeColor = SKColor.red
        lineWidth = 5.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//var yourline = SKShapeNode()
//var pathToDraw = CGMutablePath()
//let location = touch.location(in: self)
//if let cb = currentBall {
//    pathToDraw.move(to: cb.startLocation)
//    pathToDraw.addLine(to: location)
//    yourline.path = pathToDraw
//    yourline.strokeColor = SKColor.red
//    yourline.lineWidth = 5.0
//    yourline.name = "arrow"
//    addChild(yourline)
//}
