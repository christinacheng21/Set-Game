//
//  SetGame.swift
//  SetGame
//
//  Created by Christina Cheng on 12/1/18.
//  Copyright © 2018 Christina Cheng. All rights reserved.
//

import Foundation

// X is working! 1. unselect
// X is working! 2. set to 0 selected after 3
// X is working! 3. debug isSet
// X 4. points
// X 5. new cards come from off screen
// X 6. card set needs to be removed
// 7. 81 cards
// 8. squiggle

class SetGame{
    
    private var remainingDeck: [Card]
    var visibleDeck: [Card]
    var deadCardIndices: [Int]
    var selectedCardIndices: [Int] {
        didSet {
            setGameViewControllerDelegate.onSelectedCardIndicesChanged(selectedIndices: selectedCardIndices, isSet: selectedCardsAreASet())
        }
    }
    var setGameViewControllerDelegate: SetGameDelegate
    var points: Int {
        didSet {
            setGameViewControllerDelegate.onPointsChanged(newPoints: points)
        }
    }
    
    init(viewController: SetGameDelegate){
        points = 0
        remainingDeck = []
        visibleDeck = []
        deadCardIndices = []
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
        self.setGameViewControllerDelegate = viewController
    }
    
    func addOneCard() {
        visibleDeck.append(remainingDeck.remove(at: 0))
    }
    
    func onCardTouched(indexOfTouchedCard : Int ) {
        // check if one of already selected
        if (selectedCardIndices.count == 3){
            selectedCardIndices = [indexOfTouchedCard]
        } else if (selectedCardIndices.contains(indexOfTouchedCard)){
            selectedCardIndices.remove(at: selectedCardIndices.index(of: indexOfTouchedCard)!)
        } else {
            selectedCardIndices.append(indexOfTouchedCard)
        }
        if (selectedCardsAreASet() ?? false) {
            points += 1
//            deadCardIndices.append(contentsOf: selectedCardIndices)
            for index in selectedCardIndices {
                deadCardIndices.append(index)
            }
            
        }
    }
    
    func selectedCardsAreASet() -> Bool?{
        // debug here
        if (selectedCardIndices.count != 3){
            return nil
        } else {
            var selectedCards: [Card] = []
            var properties: [[Int]] = [[], [], [], []]
            for index in selectedCardIndices {
                selectedCards.append(visibleDeck[index])
            }
            for card in selectedCards {
                properties[0].append(card.color)
                properties[1].append(card.number)
                properties[2].append(card.shading)
                properties[3].append(card.symbol)
            }
            for row in properties {
                if (!isRowValid(row: row)){
                    return false
                }
            }
            return true
        }
    }
    
    func isRowValid(row: [Int]) -> Bool {
        return ((row[0] == row[1] && row[1] == row[2]) || (row[0] != row[1] && row[1] != row[2] && row[0] != row[2]) )
        
//        if (row[0] == row[1] && row[1] == row[2]){
//            return true
//        } else if (row[0] != row[1] && row[1] != row[2] && row[0] != row[2]){
//            return true
//        } else {
//            return false
//        }
    }
    
}
