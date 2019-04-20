//
//  SetDrawnCardView.swift
//  SetGame
//
//  Created by Christina Cheng on 3/2/19.
//  Copyright © 2019 Christina Cheng. All rights reserved.
//

import Foundation
import UIKit

public class SetDrawnCardView: UIView {
    
    var number: Int?
    var symbol: Int?
    var shading: Int?
    var color: Int?
    
    

    // todo initializer override?
    func setCardFeatures(number: Int, symbol: Int, shading: Int, color: Int?) {
        self.number = number
        self.symbol = symbol
        self.shading = shading
        self.color = color
        self.isUserInteractionEnabled = true
    }

    
    override public func draw(_ rect: CGRect) {
        self.backgroundColor = UIColor.white
        if (number != nil) {
            drawThisCard()
        }
    }
    
    // parameters: look at properties of card
    // determines specifics of card
    func drawThisCard() {
        // modify color for shading
        var colorValue: UIColor
        switch (color!){
        case 1:
            colorValue = UIColor.green
            
        case 2:
            colorValue = UIColor.cyan
            
        case 3:
            colorValue = UIColor.black
            
        default: colorValue = UIColor.black
        }
        
        if (shading == 2) {
            colorValue = colorValue.withAlphaComponent(0.2)
        }
        
        
        
//        if (shading == 2) { self.color = UIColor(color)}
        
        // interpret number
        switch (number!){
        case 1: drawOne(colorValue: colorValue)
            
        case 2: drawTwo(colorValue: colorValue)
            
        case 3: drawThree(colorValue: colorValue)
        
        default: break
            
        }
        
        
        
        // interpret symbol
        // shading
        // color
        // -> done in draw<Shape> function
    }
    
    //
    func drawOne(colorValue: UIColor) {
        let frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        switch (symbol!){
        case 1:
            drawDiamond(rect: frame, color: colorValue)
            
        case 2:
            drawSquiggle(rect: frame, color: colorValue)
            
        case 3:
            drawCylinder(rect: frame, color: colorValue)
            
        default: break
            
        }
    }
    
    func drawTwo(colorValue: UIColor) {
        let verticalOffset1And2 = self.frame.height / 4.0
        let horizontalOffset2 = self.frame.width / 2.0
        
        let frame1 = CGRect(x: 0, y: verticalOffset1And2, width: self.frame.width/2, height: self.frame.height/2)
        let frame2 = CGRect(x: horizontalOffset2, y: verticalOffset1And2, width: self.frame.width/2, height: self.frame.height/2)
        
        
        
        switch (symbol!){
        case 1:
            drawDiamond(rect: frame1, color: colorValue)
            drawDiamond(rect: frame2, color: colorValue)
            
            
        case 2:
            drawSquiggle(rect: frame1, color: colorValue)
            drawSquiggle(rect: frame2, color: colorValue)
        
            
        case 3:
            drawCylinder(rect: frame1, color: colorValue)
            drawCylinder(rect: frame2, color: colorValue)
          
            
        default: break
            
        }
    }
    
    func drawThree(colorValue: UIColor){
        let verticalOffset1And2And3 = self.frame.height / 3.0
        let horizontalOffset2 = self.frame.width / 3.0
        let horizontalOffset3 = 2.0*self.frame.width / 3.0
        
        let frame1 = CGRect(x: 0, y: verticalOffset1And2And3, width: self.frame.width/3, height: self.frame.height/3)
        let frame2 = CGRect(x: horizontalOffset2, y: verticalOffset1And2And3, width: self.frame.width/3, height: self.frame.height/3)
        let frame3 = CGRect(x: horizontalOffset3, y: verticalOffset1And2And3, width: self.frame.width/3, height: self.frame.height/3)
        
        switch (symbol!){
        case 1:
            drawDiamond(rect: frame1, color: colorValue)
            drawDiamond(rect: frame2, color: colorValue)
            drawDiamond(rect: frame3, color: colorValue)
            
            
        case 2:
            drawSquiggle(rect: frame1, color: colorValue)
            drawSquiggle(rect: frame2, color: colorValue)
            drawSquiggle(rect: frame3, color: colorValue)
            
            
        case 3:
            drawCylinder(rect: frame1, color: colorValue)
            drawCylinder(rect: frame2, color: colorValue)
            drawCylinder(rect: frame3, color: colorValue)
            
            
        default: break
            
        }
    }
    
    func drawDiamond(rect: CGRect, color: UIColor){
        let path = UIBezierPath()
        let offsetX = rect.origin.x
        let offsetY = rect.origin.y
        
        let topPoint = CGPoint(x: offsetX + rect.size.width/2, y: offsetY + 0.0)
        let rightPoint = CGPoint(x: offsetX + rect.size.width, y: offsetY + rect.size.height/2)
        let bottomPoint = CGPoint(x: offsetX + rect.size.width/2, y: offsetY + rect.size.height)
        let leftPoint = CGPoint(x: offsetX + 0.0, y: offsetY + rect.size.height/2)
        path.move(to: topPoint)
        path.addLine(to: rightPoint)
        path.addLine(to: bottomPoint)
        path.addLine(to: leftPoint)
        path.close()
        
        if (shading == 1) {
            color.setStroke()
            path.stroke()
        } else {
            color.setFill()
            path.fill()
        }
        
    }
    
    func drawSquiggle(rect: CGRect, color: UIColor){
        let path = UIBezierPath()
        
        let offsetX = rect.origin.x
        let offsetY =  rect.origin.y
        
        let centerPoint = CGPoint(x: offsetX + rect.width/2, y: offsetY + rect.height/2)
        
        let bottomLeft = CGPoint(x: offsetX, y: offsetY + rect.size.height)
        let bottomRight = CGPoint(x: offsetX + rect.size.width, y: offsetY + rect.size.height)
        let topLeft = CGPoint(x: offsetX, y: offsetY)
        let topRight = CGPoint(x: offsetX + rect.size.width, y: offsetY)

        let leftmostAnchorPoint = bottomLeft
        let rightmostAnchorPoint = bottomRight
        let leftAnchorPoint =  topLeft
        let rightAnchorPoint = topRight
        
        path.move(to: leftmostAnchorPoint)
        path.addQuadCurve(to: leftAnchorPoint, controlPoint: CGPoint(x: bottomLeft.x + rect.size.width/8, y: bottomLeft.y))
        path.addQuadCurve(to: rightmostAnchorPoint, controlPoint: bottomRight)
        path.addQuadCurve(to: rightAnchorPoint, controlPoint: CGPoint(x: topRight.x + rect.size.width/8, y: topRight.y))
        path.addQuadCurve(to: leftmostAnchorPoint, controlPoint: topLeft)
        
        if (shading == 1) {
            color.setStroke()
            path.stroke()
        } else {
            color.setFill()
            path.fill()
        }
        
    }
    
    func drawCylinder(rect: CGRect, color: UIColor){
        
        let offsetX = rect.origin.x
        let offsetY = rect.origin.y
        
        let x = rect.size.width
        let y = rect.size.height
        let path = UIBezierPath()
        let leftCenter = CGPoint(x: offsetX + y/3, y: offsetY + y/2)
        let rightCenter = CGPoint(x: offsetX + x-y/3, y: offsetY + y/2)
        let topLeft = CGPoint(x: offsetX + y/3, y: offsetY + y/6)
        let bottomLeft = CGPoint(x: offsetX + y/3, y: offsetY + y*5/6)
        let topRight = CGPoint(x: offsetX + x-y/3, y: offsetY + y/6)
        let bottomRight = CGPoint(x: offsetX + x-y/3, y: offsetY + y*5/6)
        path.move(to: topLeft)
        path.addLine(to: topRight)
        //path.addLine(to: bottomRight)
        path.addArc(withCenter: rightCenter, radius: y/3, startAngle: CGFloat(Double.pi*1.5), endAngle:CGFloat(Double.pi*0.5), clockwise: true)
        path.addLine(to: bottomLeft)
        path.addArc(withCenter: leftCenter, radius: y/3, startAngle: CGFloat(Double.pi*0.5), endAngle: CGFloat(Double.pi*1.5), clockwise: true)
        
        if (shading == 1) {
            color.setStroke()
            path.stroke()
        } else {
            color.setFill()
            path.fill()
        }
    }
}
