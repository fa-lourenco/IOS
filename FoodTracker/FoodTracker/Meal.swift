//
//  Meal.swift
//  FoodTracker
//
//  Created by SQIMI_VM on 14/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

class Meal{
    //    MARK:Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //    MARK:Inicialization
    init?(name: String, photo: UIImage?, rating: Int){
        //      Init should fail case name is empty or rating is below zero
        guard !name.isEmpty else {
            return nil
        }
        //      rating between 0 and 5
        guard (rating >= 0) && (rating <= 5) else{
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}

