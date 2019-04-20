/*
  ViewController.swift
  SetGame

  Created by Christina Cheng on 12/1/18.
  Copyright © 2018 Christina Cheng. All rights reserved.
*/

import UIKit

class ViewController: UIViewController {
    
    var setViews : SetView?
    var game: SetGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = SetGame()
        

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
    }
    
    
    /*
     @objc func buttonAction(sender: UIButton){
     let oldCardCount = setViews?.drawnCardViews.count
     game?.addOneCard()
     let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchCard(_:)))
     let newCard = self.setViews!.drawnCardViews[oldCardCount!]
     newCard.addGestureRecognizer(tapGesture)
     
     setViews!.visibleDeck = game!.visibleDeck
     UIView.animate(withDuration: 4) {
     self.setViews?.addOneCard()
     self.view.addSubview(newCard)
     }
     }
     */
    
    @objc func touchCard(_ recognizer: UITapGestureRecognizer) {
        print("card touched")
    }
    
    func makeButton(){
        let button = UIButton(frame: CGRect(x: 10, y: view.frame.height - 50, width: 100, height: 50))
        button.setTitle("DRAW", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        view.addSubview(button)
    }
    
    func prepareCardsFromModel() {
        
    }

}

