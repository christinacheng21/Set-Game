/*
  ViewController.swift
  SetGame

  Created by Christina Cheng on 12/1/18.
  Copyright © 2018 Christina Cheng. All rights reserved.
*/

import UIKit

protocol SetGameDelegate {
    func onSelectedCardIndicesChanged(selectedIndices: [Int], isSet: Bool?)
}

class ViewController: UIViewController, SetGameDelegate {
    func onSelectedCardIndicesChanged(selectedIndices: [Int], isSet: Bool?) {
        // todo
    }
    
    
    var setViews : SetView?
    var game: SetGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = SetGame(viewController: self)

        let visibleCards = game?.visibleDeck
        setViews = SetView(numCards2: game!.visibleDeck.count, frame2: view.frame, ratio2: 1.0, visibleCards: visibleCards!)
        
        //setViews!.setCardViewsToVisibleCardData(visibleCardsData: game!.visibleDeck)
        
        for card in setViews!.drawnCardViews {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchCard(_:)))
            card.addGestureRecognizer(tapGesture)
        }
        
        setViews!.layoutAllCardViews(view: view)
        
        makeButton()
    }
    
    @objc func buttonAction(sender: UIButton){
        let oldCardsCount = setViews?.drawnCardViews.count
        game?.addOneCard()
        setViews!.visibleDeck = game!.visibleDeck
        
        
        
        UIView.animate(withDuration: 4) {
            self.setViews?.addOneCard()
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.touchCard(_:)))
            let newCard = self.setViews!.drawnCardViews[oldCardsCount!]
            newCard.addGestureRecognizer(tapGesture)
            
            self.view.addSubview((self.setViews?.drawnCardViews[oldCardsCount!])!)
        }
        
        // updateViewFromModel
    }
    
    @objc func touchCard(_ recognizer: UITapGestureRecognizer) {
        print("card touched")
        let touchedView = recognizer.view as! SetDrawnCardView
        let indexOfTouched = setViews?.drawnCardViews.index(of: touchedView)!
        game?.onCardTouched(indexOfTouchedCard: indexOfTouched!)

        // add properties to card for drawing isSelected, isMatch, isNotMatch, etc.
        
    }
    
    func makeButton(){
        let button = UIButton(frame: CGRect(x: 10, y: view.frame.height - 50, width: 100, height: 50))
        button.setTitle("DRAW", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        view.addSubview(button)
    }
    
    // functions which change model
    // 1. add card
    // 2. touch card X
    
//    // functions which respond to model changes
//    func updateViewFromModel() { // respond to model changes to card touches
//        // 1. check model state
//            // which cards are selected?
//
//        // which cards to update visuals of, and isPartOfTriple?
//        // self.game?.selectedCardsAreASet // isMatch?
//    }
    
    func onSelectedCardIndicesChanged() {
        // 2. update visuals of cards to match model
        //            // isSelected, and isPartOfTriple, and isMatch?
        //
        //        for cardIndex in (self.game?.selectedCardIndices)! {
        //            // todo make all cards white
        //            // make selected cards grey
        //            // if set/failed set, make green|red
        ////            setViews?.drawnCardViews[cardIndex].
        //        }
    }

}

