//
//  Member.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Au Yeung Tsz Wang on 31/3/2021.
//

import Foundation
import RealmSwift
import ObjectMapper

class Member: Object, Mappable{
    @objc dynamic var memberfirstName : String?
    @objc dynamic var memberlastName : String?
    @objc dynamic var memberNumber : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        memberfirstName <- map["memberfirstName"]
        memberlastName <- map["memberlastName"]
        memberNumber <- map["memberNumber"]
    }
    
    func demoMember()-> Member{
        var demo = Member()
        demo.memberfirstName = "First"
        demo.memberlastName = "Last Name"
        demo.memberNumber = "12345678"
        return demo
    }
    
}
