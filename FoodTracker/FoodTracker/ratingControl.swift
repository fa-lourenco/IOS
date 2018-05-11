//
//  ratingControl.swift
//  FoodTracker
//
//  Created by SQIMI_VM on 11/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

@IBDesignable class ratingControl: UIStackView {
    
    //    MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0{didSet{
        updateSelectionStates()
        }
        
    }
    @IBInspectable var starSize: CGSize = CGSize(width:44.0, height:44.0)
        {didSet{setupButtons()}}
    @IBInspectable var starCount: Int = 5{
        didSet{setupButtons()}}
    
    //  MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder:coder)
        setupButtons()
    }
    
    //      MARK:Button Action
    @objc func buttonTapped(button: UIButton){
        guard let index = ratingButtons.index(of: button)
            else
        {
            fatalError("The Button \(button), is not in the ratingsButtons array \(ratingButtons)")
        }
//        button+1
        let selectedRating = index+1
        
        if selectedRating == rating{
            rating=0
        }
        else {
            rating = selectedRating
        }
        
    }
    
    private func updateSelectionStates(){
        for (index, button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
//            set hint string for current star selected
            let hintString: String?
            if rating == index+1{
                hintString = "Tap to reset rating"
            }
            else{
                hintString=nil
            }
            let valueString:String
            
            switch(rating){
            case 0:
                valueString="No rating set"
            case 1:
                valueString="1 Star set"
            default:
                valueString="\(rating) stars set"
                
            }
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
    
    //    MARK: Private Methods
    var i = 0
    private func setupButtons(){
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        let bundle = Bundle(for: type(of:self))
        let filledStar = UIImage(named: "filledStar", in:bundle, compatibleWith:self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in:bundle, compatibleWith:self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar",in:bundle, compatibleWith:self.traitCollection)
        
        
        for index in 0..<starCount {
            
            let button = UIButton()
            button.setTitle(String(i), for: .normal)
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(filledStar, for: [.highlighted, .selected])
            
//            button.backgroundColor = UIColor.blue
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant:starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
//            setAccessibility label
            button.accessibilityLabel = "Set \(index+1) star rating"
            
            
            button.addTarget(self, action: #selector( ratingControl.buttonTapped( button:)) , for: .touchUpInside)
            
//          Button to stack
            addArrangedSubview(button)
//          Button to array
            ratingButtons.append(button)
            
        }
        updateSelectionStates()
    }
}
