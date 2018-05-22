//
//  FirstViewController.swift
//  SDKExample
//
//  Created by SQIMI_VM on 22/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit
import NMAKit
import DropDown

class FirstViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet var map: NMAMapView!
    
    
    @IBOutlet weak var stylesView: UIView!
    let dDown = DropDown()
    
    
    //MARK: Built-ins
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        map.useHighResolutionMap = true
        map.zoomLevel = 13
        map.set(geoCenter: NMAGeoCoordinates(latitude: 38.7, longitude: -9.14),animation: .linear)
        map.copyrightLogoPosition = NMALayoutPosition.bottomLeft
        
        stylesView.isHidden = true
        dDown.dataSource = ["Normal Day", "Satellite Day", "Normal Night", "Reduced Day", "Reduced Night"]
        
    }
    //    MARK: Actions
    @IBAction func zoomIn(_ sender: UIButton) {
        map.zoomLevel=map.zoomLevel+1
    }
    
    @IBAction func zoomOut(_ sender: UIButton) {
        map.zoomLevel=map.zoomLevel-1
    }
    @IBAction func ManageStylesPop(_ sender: UIButton) {
       stylesView.isHidden = !stylesView.isHidden
        if stylesView.isHidden{
            dDown.anchorView = stylesView
            dDown.hide()
        }
        else{
            dDown.show()
        }
    }
}
