//
//  CommonError.swift
//  VYNGLE
//
//  Created by Sujeet on 8/25/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import ObjectMapper

struct ErrorResult {
    var error: String
}

extension ErrorResult: Mappable {
    init?(map: Map) {
        guard map.JSON["status"] != nil || map.JSON["error"] != nil else {
            return nil
        }
        error = ""
    }
    
    mutating func mapping(map: Map) {
        var status: Int?
        status <- map["status"]
        if let status = status {
            error = "\(status)"
        }
        guard error.isEmpty else { return }
        error <- map["error"]
    }
}
