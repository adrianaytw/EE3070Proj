//
//  Record.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Au Yeung Tsz Wang on 31/3/2021.
//

import Foundation
import RealmSwift
import ObjectMapper

class Record: Object, Mappable{
    @objc dynamic var purchaseDate : Date?
    @objc dynamic var purchaseAmount : Double = 0
    @objc dynamic var purchaseQuantity : Int = 0
    @objc dynamic var product : Product?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        purchaseDate <- map["purchaseDate"]
        purchaseAmount <- map["purchaseAmount"]
        purchaseQuantity <- map["purchaseQuantity"]
        product <- map["product"]
    }
   
}

