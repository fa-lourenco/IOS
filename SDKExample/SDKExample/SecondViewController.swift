//
//  SecondViewController.swift
//  SDKExample
//
//  Created by SQIMI_VM on 22/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit
import DropDown

class SecondViewController: UIViewController {
    
    //MARK:Properties
    let comboBox = DropDown()
    
    let constKelvin = 272.22
    var x : Double! = 38.7
    var y : Double! = -9.57
    let cities = ["Lisbon,PT", "Madrid,ES", "Paris,FR", "London,UK", "NewYork,US", "Dubai,UAE"]
    
    @IBOutlet var swipeRight: UISwipeGestureRecognizer!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempCurrentLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDegreeLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bindView: UIStackView!
    @IBOutlet weak var weatherPlace: UILabel!
    @IBOutlet weak var viewContainer: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupComboBox()
        viewContainer.isHidden = true
        comboBox.selectionAction = {
            [weak self] (index, item) in
            self?.weatherPlace.text = item
        }
    }
    
    func setupComboBox(){
        comboBox.anchorView = bindView
        comboBox.dataSource = cities
        comboBox.dismissMode = .automatic
    }
    
    func createRequest(){
        //Weather API
        let openWeatherKey = "8285d200513a2f35875b7f4e1ce3e66a"
        //let weatherPlace = "Lisbon,PT"
        let jsonWeatherApiCall = "http://api.openweathermap.org/data/2.5/weather"
        let jsonWeather = jsonWeatherApiCall+"?q="+weatherPlace.text!+"&appId="+"\(openWeatherKey)"
        print (jsonWeather)
        
        guard let url = URL(string: jsonWeather) else {return}
        
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            if(error != nil){
                print(error!.localizedDescription)
            }
            do{
                guard let data = data else {return}
                //Json Decoding
                let weatherData = try JSONDecoder().decode(Root.self, from: data)
                    DispatchQueue.main.async{
                        self.showAPIInfo(data:weatherData)
                        print (weatherData)
                    }
                
            }catch let error{
                    self.viewContainer.isHidden = true
            }
            
            }.resume()
    }
    
    func showAPIInfo(data:Root){
        
        let hourFormatFromDate = DateFormatter()
        hourFormatFromDate.timeStyle = .medium
        hourFormatFromDate.dateStyle = .none
        hourFormatFromDate.locale = Locale(identifier: "pt_PT")
        
        cityLabel.text = data.name
        tempMaxLabel.text = String(format: "%.1f",data.main.temp_max-constKelvin)
        tempMinLabel.text = String(format: "%.1f",data.main.temp_min-constKelvin)
        tempCurrentLabel.text = String(format: "%.1f",data.main.temp-constKelvin)
        weatherLabel.text = data.weather[0].main
        windSpeedLabel.text = String(data.wind.speed)
        windDegreeLabel.text = String(data.wind.deg)
        sunriseLabel.text = hourFormatFromDate.string(from: NSDate(timeIntervalSince1970: data.sys.sunrise) as Date)
        sunsetLabel.text = hourFormatFromDate.string(from: NSDate(timeIntervalSince1970: data.sys.sunset) as Date)
        humidityLabel.text = String(data.main.humidity)
        dateLabel.text = hourFormatFromDate.string(from: NSDate(timeIntervalSince1970: data.dt) as Date)
        x=data.coord.lon
        y=data.coord.lat
        
        viewContainer.isHidden = false

    
    }
    
    @IBAction func seeOption(_ sender: UIButton) {
        comboBox.show()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let navBar = segue.destination as? UITabBarController{
            navBar.viewControllers?.forEach{
            if let mapView = $0 as? FirstViewController{
                switch(segue.identifier ?? ""){
                case "coordinates":
                    print(x)
                    print(y)
                    mapView.x = x
                    mapView.y = y
                    
                default:
                    fatalError("Unexpected Segue \(segue.identifier ?? "")")
                    
                }}}
            }
    }
        
    
    
     @IBAction func btnAPICAll(_ sender: UIButton)
    {
        createRequest()
    }
       
}

