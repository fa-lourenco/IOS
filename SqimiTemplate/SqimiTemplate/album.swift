//
//  Message.swift
//  SqimiTemplate
//
//  Created by SQIMI_VM on 17/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

class album {
    
    var photoId: UIImage?
    var photoAddress: UIImage?
    var photoJob: UIImage?
    
    init?(id: UIImage?, address: UIImage?, job: UIImage?){
        self.photoId = id
        self.photoAddress = address
        self.photoJob = job
    }
    
}
