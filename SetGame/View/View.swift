//
//  View.swift
//  SetGame
//
//  Created by Christina Cheng on 1/12/19.
//  Copyright © 2019 Christina Cheng. All rights reserved.
//

import Foundation
import UIKit

class SetView {
    
    var numCards:Int
    var rootFrame: CGRect?
    var ratio: Double
    var cardViews: [UIView]
    var visibleDeck: [Card]
    var drawnCardViews: [SetDrawnCardView]
    
    init(numCards2: Int, frame2: CGRect?, ratio2: Double, visibleCards: [Card] ){
        numCards = numCards2
        rootFrame = frame2
        ratio = ratio2
        visibleDeck = visibleCards
        let cardMaker = CardViewMaker()
        cardViews = cardMaker.makeCardViews(numCards: numCards, frame: rootFrame!, ratio: ratio)
        drawnCardViews = cardMaker.makeDrawnCardViews(myCardViews: cardViews, modelVisibleCards: visibleDeck)
    }
    
    func layoutAllCardViews(view : UIView) {
        for myView in drawnCardViews {
            view.addSubview(myView)
        }
    }
   /*
    func setCardViewsToVisibleCardData (visibleCardsData : [Card]) {
        for cardView in cardViews {
            drawCardView(cardView: cardView)
        }
    }
    
    func drawCardView(cardView : UIView){
        let drawnSetCardView = SetDrawnCardView(frame: cardView.frame)
        cardView.addSubview(drawnSetCardView)
    }
     */

    func getCardViews() -> [UIView]{
        return self.cardViews
    }
    
    func animateAddingOneCard() { // todo new card comes from deckFrame
        SetDrawnCardView.animate(withDuration: 4) {
        
            self.addOneCard()
        }
    }
    
    //TO DO: animate -> add view to model of new card and update model -> view what the new card is
    func addOneCard() {
        
        
        
        let cardMaker = CardViewMaker()
        let newBlankCardViews = cardMaker.makeCardViews(numCards: numCards+1, frame: rootFrame!, ratio: ratio)
        let drawnNewCardViews = cardMaker.makeDrawnCardViews(myCardViews: newBlankCardViews, modelVisibleCards: visibleDeck)
        
        resizeAndMoveOldCards(drawnNewCardViews: drawnNewCardViews)
        
        addNewCard(drawnNewCardViews: drawnNewCardViews)
    }
    
    func resizeAndMoveOldCards(drawnNewCardViews: [SetDrawnCardView]) {
        for i in self.drawnCardViews.indices {
            self.drawnCardViews[i].frame = drawnNewCardViews[i].frame
        }
    }
    
    func addNewCard(drawnNewCardViews: [SetDrawnCardView]){
        // 1. get reference to new card
        // 2. store final frame of new card
        // 3. set initial frame of new card
        // 4. set card to initial frame
        self.drawnCardViews.append( drawnNewCardViews.last! ) //5. append here
        // 6. set to final frame
        numCards += 1
    }
    
    
    
}




