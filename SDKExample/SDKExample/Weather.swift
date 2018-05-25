//
//  Weather.swift
//  SDKExample
//
//  Created by SQIMI_VM on 24/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

//{} into dictionaries
//. to Doubles
//INT to int
//"" to String

let jsonString = """
{"coord":{"lon":-9.14,"lat":38.71},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10d"},{"id":701,"main":"Mist","description":"mist","icon":"50d"}],"base":"stations","main":{"temp":288.8,"pressure":1013,"humidity":93,"temp_min":288.15,"temp_max":289.15},"visibility":8000,"wind":{"speed":1.5,"deg":70},"clouds":{"all":20},"dt":1527154200,"sys":{"type":1,"id":5961,"message":0.0025,"country":"PT","sunrise":1527139054,"sunset":1527191384},"id":2267057,"name":"Lisbon","cod":200}
"""

struct Root: Decodable {
    let coord: coordinate
    let weather: [weatherProp]
    let base: String
    let main: miscProp
    let visibility: Int
    let wind: windProp
    let clouds: cloudProp
    let dt: Double
    let sys: configProp
    let id: Int
    let name: String
    let cod: Int
}

struct coordinate: Decodable {
    
    let lon: Double
    let lat: Double
}

struct weatherProp: Decodable {
    
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct miscProp: Decodable {
    
    let temp: Double
    let pressure: Int
    let humidity: Int
    let temp_min: Double
    let temp_max: Double
}

struct windProp: Decodable{
    
    let speed: Double
    let deg: Double
}

struct cloudProp: Decodable {
    
    let all: Int
}

struct configProp: Decodable{
    
    let type: Int
    let id: Int
    let message: Double
    let country: String
    let sunrise: Double
    let sunset: Double
}
