//
//  ArduinoResponse.swift
//  TabBarAppTemplate+LoginScreen
//
//  Created by Bowie Tso on 9/4/2021.
//
import Foundation
import ObjectMapper

class ArduinoResponse<T: Mappable>: Mappable {
    
    var success: Bool = false
    var remarks: String?
    var value: T?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        success <- map["Success"]
        remarks  <- map["Remarks"]
        value   <- map["Value"]
    }
}
