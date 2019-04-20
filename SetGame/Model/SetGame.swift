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
    var selectedCardIndices: [Int]
    
    init(){
        remainingDeck = []
        visibleDeck = []
        selectedCardIndices = []
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
    
    func onCardTouched(indexOfTouchedCard : Int ) {
        // check if one of already selected
        if (selectedCardIndices.contains(indexOfTouchedCard)){
            selectedCardIndices.remove(at: selectedCardIndices.index(of: indexOfTouchedCard)!)
        } else {
            selectedCardIndices.append(indexOfTouchedCard)
        }
        
        // if now 3 total selected
        if (selectedCardIndices.count == 3) {
            selectedCardsAreASet()
        }
    }
    
    func selectedCardsAreASet() -> Bool {
        var selectedCards: [Card] = []
        for index in selectedCardIndices {
            selectedCards.append(visibleDeck[index])
        }
        // todo actually compare, not always return false
        //

        return false
    }
    
}
