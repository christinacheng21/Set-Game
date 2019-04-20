//
//  Grid.swift
//  SetGame
//
//  Created by Christina Cheng on 2/23/19.
//  Copyright © 2019 Christina Cheng. All rights reserved.
//

import Foundation
import UIKit

//given a frame and number of cards, calculate the number of columns and rows and height per column and height per row
class Grid {
    
    var frame: CGRect?
    var numCards: Int
    var numColsRows: Int {
        return Int(Double(numCards).squareRoot().rounded(.up))
    }
    var cellDimensions: Int {
        var shorterOuterDimension : CGFloat?
        if (Double((frame?.height)!) > Double((frame?.width)!)) { shorterOuterDimension = frame?.width} else {
            shorterOuterDimension = frame?.height
        }
        return Int((shorterOuterDimension)!)/numColsRows
    }
    
    init(frame: CGRect?, numCards: Int){
        self.frame = frame
        self.numCards = numCards
    }
    
}
