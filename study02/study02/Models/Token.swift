//
//  Token.swift
//  study02
//
//  Created by 조윤영 on 19/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import Foundation
import ObjectMapper

struct Token:Mappable {
    var token: String?
    
    init?(map:Map) {
        
    }
    mutating func mapping(map: Map) {
        token<-map["token"]
    }
}
