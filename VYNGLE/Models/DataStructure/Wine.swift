//
//  Wine.swift
//  VYNGLE
//
//  Created by Sujeet on 8/31/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

// server_status -200 - success
// 300 - faul


class WineDS: Object, Mappable {
    dynamic var id: Int = 1
    dynamic var os = ""
    dynamic var version = ""
    dynamic var request_time = ""
    dynamic var server_status = 200

    var marketingText = List<MarketingText>()
    var featureWines = List<FeatureWines>()
    var allWines = List<AllWines>()

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
        server_status  <- map["request_context.server_status"]
        marketingText <- map["marketing_text"]
        featureWines <- map["feature_wines"]
        allWines <- map["all_wines"]

    }
    
    func fetchWineData() -> WineDS {
        return WineStorage.shared.wineData
    }
}

final class MarketingText: Object {
    dynamic var id: String = ""
    dynamic var text: String = ""
    dynamic var image: String = ""
}

extension MarketingText: Mappable {
    convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
        image <- map["image"]
    }
}


final class FeatureWines: Object {
    dynamic var product_id: String = ""
    dynamic var product_name: String = ""
    dynamic var nw_item: Bool = false
    dynamic var last_bottles: Bool = false
    dynamic var currency: String = ""
    dynamic var bottle_price: Float = 0
    dynamic var discount_bottle_price: Float = 0
    
}

extension FeatureWines: Mappable {
    convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        product_id <- map["product_id"]
        product_name <- map["product_name"]
        nw_item <- map["new_item"]
        last_bottles <- map["last_bottles"]
        currency <- map["currency"]
        bottle_price <- map["bottle_price"]
        discount_bottle_price <- map["discount_bottle_price"]
    }
}


final class AllWines: Object {
    dynamic var product_id: String = ""
    dynamic var product_name: String = ""
    dynamic var nw_item: Bool = false
    dynamic var last_bottles: Bool = false
    dynamic var currency: String = ""
    dynamic var bottle_price: Float = 0
    dynamic var discount_bottle_price: Float = 0
}

extension AllWines: Mappable {
    convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        product_id <- map["product_id"]
        product_name <- map["product_name"]
        nw_item <- map["new_item"]
        last_bottles <- map["last_bottles"]
        currency <- map["currency"]
        bottle_price <- map["bottle_price"]
        discount_bottle_price <- map["discount_bottle_price"]
    }
}

