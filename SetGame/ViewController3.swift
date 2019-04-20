//
//  ViewController3.swift
//  SetGame
//
//  Created by Christina Cheng on 2/9/19.
//  Copyright © 2019 Christina Cheng. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    var redView: UIView?
    var blueView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeButton()
        
        let myDrawnCardView = DrawCardView(frame: view.frame)
        view.addSubview(myDrawnCardView)
    }
    
    func makeButton(){
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        button.setTitle("Animate", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.backgroundColor = UIColor.black
        view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton){
        print("button tapped")
        UIView.animate(withDuration: 4) {
            let currentFrame = self.blueView?.frame
            let newFrame = currentFrame?.insetBy(dx: -10, dy: -10)
//            self.blueView!.frame = newFrame!
//            self.blueView!.backgroundColor = UIColor.black
        }
    }

    
    
    
    //        let frame1 = CGRect(x: 1, y: 1, width: 100, height: 100)
    //        redView = UIView(frame: frame1)
    //        redView!.backgroundColor = UIColor.red
    //        view.addSubview(redView!)
    //
    //        let frame2 = CGRect(x: 200, y: 200, width: 100, height: 100)
    //        blueView = UIView(frame: frame2)
    //        blueView!.backgroundColor = UIColor.blue
    //
    //
    //        UIView.animate(withDuration: 4) {
    //            self.redView!.frame = frame2
    //        }
    ////        newView.frame = frame2
    //        view.addSubview(blueView!)
}



