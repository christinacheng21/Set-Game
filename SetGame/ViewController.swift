/*
  ViewController.swift
  SetGame

  Created by Christina Cheng on 12/1/18.
  Copyright © 2018 Christina Cheng. All rights reserved.
*/

import UIKit

protocol SetGameDelegate {
    func onSelectedCardIndicesChanged(selectedIndices: [Int], isSet: Bool?)
    func onPointsChanged(newPoints: Int)
}

// TODO: change shape
class ViewController: UIViewController, SetGameDelegate {
    
    var label: UILabel?
    
    func onPointsChanged(newPoints: Int) {
        label!.text = "Points: \(newPoints)"
    }
    
    func onSelectedCardIndicesChanged(selectedIndices: [Int], isSet: Bool?) {
        // todo
        // tell view which card view was touched
        for card in (setViews?.drawnCardViews)! {
            card.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        }
        // view update card view that card was touched
        if (isSet == nil){
            for index in selectedIndices {
                setViews?.drawnCardViews[index].backgroundColor = UIColor.gray
            }
        } else if (!isSet!){
            for index in selectedIndices {
                setViews?.drawnCardViews[index].backgroundColor = UIColor.red
            }
        } else {
            for index in selectedIndices {
                setViews?.drawnCardViews[index].backgroundColor = UIColor.green
            }
        }
        for index in (game?.deadCardIndices)! {
            let card = setViews?.drawnCardViews[index]
            card?.isHidden = true
        }
        //
        // three + a match, three + not a match
        
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
        makePointLabel()
    }
    
    @objc func buttonAction(sender: UIButton){
        let oldCardsCount = setViews?.drawnCardViews.count
        game?.addOneCard()
        setViews!.visibleDeck = game!.visibleDeck
        
        let moveOldCardsAnimation : () -> Void = {self.setViews?.addOneCard()}
        
        let addOneCardAnimation : (Bool)-> Void = { _ in
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.touchCard(_:)))
            let newCard = self.setViews!.drawnCardViews[oldCardsCount!]
            newCard.addGestureRecognizer(tapGesture)
            
            let newFrame = newCard.frame
            newCard.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            
            UIView.animate(withDuration: 2){
                self.view.addSubview(newCard)
                newCard.frame = newFrame
            }
        }
        
        UIView.animate(withDuration: 4, animations: moveOldCardsAnimation, completion: addOneCardAnimation)
    }
    
    @objc func touchCard(_ recognizer: UITapGestureRecognizer) {
        print("card touched")
        let touchedView = recognizer.view as! SetDrawnCardView
        let indexOfTouched = setViews?.drawnCardViews.index(of: touchedView)!
        game?.onCardTouched(indexOfTouchedCard: indexOfTouched!)
    }
    
    func makeButton(){
        let button = UIButton(frame: CGRect(x: 10, y: view.frame.height - 50, width: 100, height: 50))
        button.setTitle("DRAW", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        view.addSubview(button)
    }
    
    func makePointLabel(){
        label = UILabel(frame: CGRect(x: 20, y: 20, width: 100, height: 50))
        label?.text = "Points: 0"
        view.addSubview(label!)
    }
    
    
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

