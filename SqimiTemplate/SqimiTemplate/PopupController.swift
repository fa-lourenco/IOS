//
//  popupController.swift
//  SqimiTemplate
//
//  Created by SQIMI_VM on 21/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class PopupController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss( animated: true, completion: nil)
    }

}
