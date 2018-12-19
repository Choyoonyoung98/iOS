//
//  APIManager.swift
//  study02
//
//  Created by 조윤영 on 19/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import Foundation

protocol APIManager {
    
}
extension APIManager {
    static func url(path: String)->String {
        return "http://bghgu.tk:8080"+path

    }
}
