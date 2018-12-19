//
//  ResponseBody.swift
//  study02
//
//  Created by 조윤영 on 19/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import Foundation

import ObjectMapper

struct ResponseBody<T: Mappable>:Mappable {
    var status:  Int?
    var message: String?
    var data: T?
    
    init?(map:Map) {
        
    }
    mutating func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data<-map["data"]
    }
}
