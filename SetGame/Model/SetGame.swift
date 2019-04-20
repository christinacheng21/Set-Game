//
//  SetGame.swift
//  SetGame
//
//  Created by Christina Cheng on 12/1/18.
//  Copyright © 2018 Christina Cheng. All rights reserved.
//

import Foundation

class SetGame{
    
    private var remainingDeck: [Card]
    var visibleDeck: [Card]
    
    init(){
        remainingDeck = []
        visibleDeck = []
        for num in 1...3{
            for symbol in 1...3{
                for shading in 1...3{
                    for color in 1...3{
                        let card = Card(number: num, symbol: symbol, shading: shading, color: color)
                        let index = Int(arc4random_uniform(UInt32(remainingDeck.count)))
                        remainingDeck.insert(card, at: index)
                    }
                }
            }
        }
        for _ in 0..<9 {
            visibleDeck.append(remainingDeck.remove(at: 0))
        }
    }
    
    func addOneCard() {
        visibleDeck.append(remainingDeck.remove(at: 0))
    }
    
}
