//
//  ViewController.swift
//  Concentration
//
//  Created by SQIMI_VM on 28/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

class gameViewController: UIViewController {
    
    private func updateFlipCountLabel(){
        let styleString: [NSAttributedStringKey:Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        ]
        
        let attributedString = NSAttributedString(string:"Flips: \(flipCount)", attributes: styleString)
        flipCountLabel.attributedText = attributedString
        
    }
    //MARK: Properties
    @IBOutlet private weak var flipCountLabel: UILabel!	{
        didSet{
        updateFlipCountLabel()
        }
        
    }
    @IBOutlet private var cardButtons: [UIButton]!
    
    var numberOfPairsOfCards:Int{
        get{
            return (cardButtons.count + 1 ) / 2
        }
    }
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards) //lazy can not have didSet
    
    private(set) var flipCount: Int = 0 {
        didSet{
           updateFlipCountLabel()
        }
    }
    //private var emojisAvailable = ["😄","🤠","🤑","😉","😊","😆","🤓","😍","🤡"]
    
    private var emojisAvailable = "😄🤠🤑😉😊😆🤓😍🤡"
    //Dicionary Declaration
    private var emojiDic = [Card:String]()
    
    //MARK:Actions
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("Card not in cardButtons")
        }
    }
    
    //MARK: Functions
        
    private func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp{
                button.setTitle( emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                let showDigit:String?
                if card.isMatched {showDigit=""} else{showDigit="?"}
                button.setTitle(showDigit, for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            }
        }
    }
    
    
    private func emoji(for card: Card) ->String {
        if emojiDic[card] == nil, emojisAvailable.count > 0 {
            let randomStringIndex = emojisAvailable.index(emojisAvailable.startIndex, offsetBy:emojisAvailable.count.arc4random)
            emojiDic[card] = String(emojisAvailable.remove(at: randomStringIndex))
        }
        return emojiDic[card] ?? "?"
    }
    
    //MARK:Built-ins
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


extension Int{
    var arc4random:Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else{
            return 0
        }
    }
}

