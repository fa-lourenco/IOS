//
//  Concentration.swift
//  Concentration
//
//  Created by SQIMI_VM on 28/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import Foundation

struct Concentration {
    
    //MARK:Properties
    private(set) var cards =  [Card]()
    
    private var oneFacedUpCard: Int?{
        get{
            var faceCardIndex:Int?
            
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if faceCardIndex == nil{
                        faceCardIndex = index
                    } else{
                        return nil
                    }
                }
            }
            return faceCardIndex
        }
        set (newValue) {
            for index in cards.indices{
                //card will be faced up if its index is equal to NewValue
                cards[index].isFaceUp = ( index == newValue )
            }
        }
        
    }
    
    //MARK: Functions
    mutating func chooseCard (at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard\(index) chosen index not in cards")
        if !cards[index].isMatched {
            if let matchIndex = oneFacedUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else{
                //no cards or 2 cards are faced up
                oneFacedUpCard = index
            }
        }
    }

    init (numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init \(numberOfPairsOfCards):not enough pairs of cards)")
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
    }
    //TODO: Shuffe cards
}
