//
//  Museum.swift
//  SDKExample
//
//  Created by SQIMI_VM on 23/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import Foundation

struct spatialReference: Codable {
    
    let wkid: Int
    let latestWkid: Int
}
struct fields: Codable {
    let fName: String
    let fType: String
    let fAlias: String
    let fSqlType: String
    let fLength: Int
    let fDomain: String
    let fDefaultValue: Int
}

struct atributes: Codable {
    
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

struct location: Codable {
    let latitude: Double
    let longitude: Double
}

struct features: Codable{
    let local: location
    let atrib: atributes
}

struct MuseumInfo: Codable {
    
    let objId: String
    let globalId: String
    let geometryType: String
    let spRef: spatialReference
    let fie: fields
    let feat: features
        
}
