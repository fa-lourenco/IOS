//
//  Meal.swift
//  FoodTracker
//
//  Created by SQIMI_VM on 14/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //Archiving Path
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    struct PropertyKey{
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        
    }
    //    MARK: NSCoding
    func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey:PropertyKey.name)
        aCoder.encode(photo, forKey:PropertyKey.photo)
        aCoder.encode(rating, forKey:PropertyKey.rating)
    }
    
    required convenience init? (coder aDecoder:NSCoder){
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name of the Meal Object", log:OSLog.default,type:.debug)
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        self.init (name:name, photo:photo, rating:rating)
    }
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
}
