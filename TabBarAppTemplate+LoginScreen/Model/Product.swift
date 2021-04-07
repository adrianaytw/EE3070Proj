//
//  Product.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Au Yeung Tsz Wang on 31/3/2021.
//

import Foundation
import RealmSwift
import ObjectMapper

class Product: Object, Mappable{
    @objc dynamic var productName : String?
    @objc dynamic var remainquantity : Int = 0
    @objc dynamic var avaliable : Bool = false
    @objc dynamic var productCode : String?
    @objc dynamic var price : Double = 0
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        productName <- map["productName"]
        remainquantity <- map["remainquantity"]
        productCode <- map["productCode"]
        avaliable <- map["avaliable"]
        price <- map["price"]
    }
    
    
}

