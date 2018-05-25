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
    
    var y: Double?
    var x: Double?
    
    //MARK: Built-ins
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(x)
        print(y)
        mapWithCoordinates(lat: y ?? 0.0, long: x ?? 0.0)
        
        dDown.dataSource = ["Satellite Day", "Normal Day", "Normal Night", "ReducedDay", "ReducedNight"]
    }
    
    override func viewDidLoad() {
        setupDropDown()
    }
    
    //set map with coordinates
    
    func mapWithCoordinates(lat: Double, long: Double){
        map.useHighResolutionMap = true
        map.zoomLevel = 13
        map.set(geoCenter: NMAGeoCoordinates(latitude: lat, longitude: long),animation: .linear)
        map.copyrightLogoPosition = NMALayoutPosition.bottomLeft
        
    }
    //    setup dropdown
    func setupDropDown(){
        
        dDown.anchorView = stylesView
        // Action triggered on selection
        dDown.selectionAction = {
            [weak self] (index, item) in
            switch(index){
            case 0: self?.map.mapScheme = NMAMapSchemeSatelliteDay
            case 1: self?.map.mapScheme = NMAMapSchemeNormalDay
            case 2: self?.map.mapScheme = NMAMapSchemeNormalNight
            case 3: self?.map.mapScheme = NMAMapSchemeReducedDay
            case 4: self?.map.mapScheme = NMAMapSchemeReducedNight
            default:return
        }
        }
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
            
            dDown.hide()
        }
        else{
            dDown.show()
        }
    }
}
