//
//  CardViewMaker.swift
//  SetGame
//
//  Created by Christina Cheng on 2/23/19.
//  Copyright © 2019 Christina Cheng. All rights reserved.
//

import Foundation
import UIKit

class CardViewMaker {
    
    func makeCardViews(numCards: Int, frame: CGRect, ratio: Double) -> [UIView]{
        var myCardViews:[UIView] = []
        let grid = Grid(frame: frame, numCards: numCards)
        var cellX = 0
        var cellY = 0
        let horzGap = grid.cellDimensions/10
        let vertGap = grid.cellDimensions/10
        for i in 0..<numCards{
            if (i%grid.numColsRows == 0){
                cellX = 0
                cellY += grid.cellDimensions
            } else {
                cellX += grid.cellDimensions
            }
            let cardWidth = grid.cellDimensions
            let cardHeight = Int(ratio)*cardWidth
            let cardX = cellX
            let cardY = cellY
            let view = UIView(frame: CGRect(x: cardX + horzGap/2, y: cardY + vertGap/2
                , width: cardWidth - horzGap, height: cardHeight - vertGap))
            view.backgroundColor = UIColor.white
            myCardViews.append(view)
        }
        
        return myCardViews
    }
    
    func makeDrawnCardViews(myCardViews : [UIView], modelVisibleCards: [Card]) -> [SetDrawnCardView] {
        var myDrawnCardViews = [SetDrawnCardView]()
        
        for i in 0..<myCardViews.count {
            let drawnCardView = SetDrawnCardView(frame: myCardViews[i].frame)
//            drawnCardView.setCardFeatures(number: 3, symbol: 2, shading: 2, color: 1)
            drawnCardView.setCardFeatures(number: modelVisibleCards[i].number, symbol: modelVisibleCards[i].symbol, shading: modelVisibleCards[i].shading, color: modelVisibleCards[i].color) // todo revert once done debugging
            drawnCardView.draw(myCardViews[i].frame)
            myDrawnCardViews.append(drawnCardView)
        }
        
        return myDrawnCardViews
    }

}
