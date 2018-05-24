//
//  Museum.swift
//  SDKExample
//
//  Created by SQIMI_VM on 23/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import Foundation

struct spatialReference: Decodable {
    
    let wkid: Int
    let latestWkid: Int
}

struct atributes: Decodable {
    
    let objectId: Int
    let codSig: Int
    let idTipo: Int
    let infoName: String
    let infoAddress: String
    let infoPhone: String
    let infoFax: String
    let infoEmail: String
    let infoSite: String
    let infoFonte: String
    let infoMunicipal: Int
    let dtmUpd: Int32
    let globalId: String
}

struct location: Decodable {
    let latitude: Double
    let longitude: Double
}

struct MuseumJSON: Decodable {
    
    let objId: String
    let globalId: String
    let geometryType: String
    var spRef: spatialReference
    var att: atributes
    var loc: location
        
}
