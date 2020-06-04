//
//  TutorialLabel.swift
//  RollOn
//
//  Created by Jonathan Evans on 6/4/20.
//  Copyright © 2020 Jon Evans. All rights reserved.
//

import Foundation
import SpriteKit

class TutorialLabel {
    
    init() {}
    
    func makeLabel(tutorialString: String) -> SKLabelNode {
        let attrString = NSMutableAttributedString(string: tutorialString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let range = NSRange(location: 0, length: tutorialString.count)
        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
        attrString.addAttributes([.foregroundColor : UIColor.white, NSAttributedString.Key.font :
            UIFont(name: "Futura-Medium", size: 30)!], range: range)
        return SKLabelNode(attributedText: attrString)
    }
}
