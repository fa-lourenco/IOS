//
//  SecondViewController.swift
//  SDKExample
//
//  Created by SQIMI_VM on 22/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func createRequest(){
        
        //general API call
        let apiCall: String = "https://services.arcgis.com/1dSrzEWVQn5kHHyK/arcgis/rest/services/POICultura/FeatureServer/3/query?where=1%3D1&outFields=*&outSR=4326&f=json"
        //let jsonEntryPoint: String = ""
        
        Alamofire.request(apiCall, method: .get).responseJSON {
            response in
            //handle Errors
            guard response.result.error == nil else{
                print("Error calling GET")
                print(response.result.error!)
                return
            }
            
            //handle Json
            guard let json = response.result.value as? NSData else {
                print ("No Object json from API")
                print ("Error: \(response.result.error)")
                return
            }
            
            print (json)
            let myDecoder = JSONDecoder()
            let museumList = try myDecoder.decode(Museum.self, from:json)
            
            }.responseString { response in
                if let error = response.result.error{
                    print(error)
                }
                if let value = response.result.value{
                    print(value)
                }
            }
    }
    
    @IBAction func btnAPICAll(_ sender: UIButton)
    {
        createRequest()
    }
}

