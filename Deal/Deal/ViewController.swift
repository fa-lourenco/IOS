//
//  ViewController.swift
//  Deal
//
//  Created by SQIMI_VM on 16/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //    MARK:Properties
    @IBOutlet weak var rightScoreLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    
    var leftScore = 0
    var rightScore = 0
    
    
    let cardNames = ["ace", "card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dealTap(_ sender: UIButton) {
        let genLeftCard:Int = Int(arc4random_uniform(13))
        let genRightCard:Int = Int(arc4random_uniform(13))
        
        leftImageView.image = UIImage(named:cardNames[genLeftCard])
        rightImageView.image = UIImage(named:cardNames[genRightCard])
        
        if genLeftCard<genRightCard {
//            right wins
            rightScore+=1
            rightScoreLabel.text = String(rightScore)
        } else if genLeftCard == genRightCard{
//            tie
            
        }else {
//            left wins
            leftScore+=1
            leftScoreLabel.text = String(leftScore)
        }
    }
    
}

