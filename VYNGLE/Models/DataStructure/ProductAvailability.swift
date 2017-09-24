//
//  ProductAvailibility.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class ProductAvailabilityDS: Object, Mappable {
    dynamic var id: Int = 1
    dynamic var os = ""
    dynamic var version = ""
    dynamic var request_time = ""
    dynamic var product_id = ""
    dynamic var order_quantity_in_bottles = ""
    dynamic var server_status = 200
    dynamic var is_available = true
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        os  <- map["request_context.os"]
        version  <- map["request_context.version"]
        request_time  <- map["request_context.request_time"]
        product_id  <- map["request_context.product_id"]
        order_quantity_in_bottles  <- map["request_context.order_quantity_in_bottles"]
        server_status  <- map["request_context.server_status"]
        is_available  <- map["product_availability.is_available"]
    }
    
    func fetchProductAvailabilityData() -> ProductAvailabilityDS {
        return ProductAvailabilityStorage.shared.productAvailabilityData
    }
}

