//
//  ViewController.swift
//  Drawing
//
//  Created by SQIMI_VM on 29/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func draw(_ rect: CGRect){
//        let path = UIBezierPath()
//        path.move(to: CGPoint(80, 150))
//        path.addLine(to:CGPoint(140, 150))
//        path.addLine(to: CGPoint(10, 105))
//        path.close()
//        UIColor.green.setFill()
//        UIColor.red.setStroke()
//        path.lineWidth = 3.0
//        
//        path.fill()
//        path.stroke()
        
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var deck = PlayingCardDeck()
        for _ in 1...10 {
            if let card = deck.draw(){
                print("\(card)")
            }
        }
    }
}

