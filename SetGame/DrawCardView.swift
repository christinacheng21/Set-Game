//
//  DrawCardView.swift
//  SetGame
//
//  Created by Christina Cheng on 2/23/19.
//  Copyright © 2019 Christina Cheng. All rights reserved.
//

import Foundation
import UIKit

class DrawCardView : UIView {

    func drawingFunction() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height/3))
        path.addLine(to: CGPoint(x: self.frame.size.width/3, y: self.frame.size.height/3))
        path.addLine(to: CGPoint(x: self.frame.size.width/3, y: 0.0))
        path.close()
        UIColor.green.setStroke()
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        drawingFunction()
    }
}

