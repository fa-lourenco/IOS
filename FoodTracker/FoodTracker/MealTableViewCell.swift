//
//  mealCell.swift
//  FoodTracker
//
//  Created by SQIMI_VM on 14/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    //    MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var ratingControl: ratingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
