//
//  OrderList.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import Foundation
/*
 {
 "order_list": [],
 "request_context": {
 "request_time": "2017-09-02 17:36:44",
 "os": "Android",
 "version": "6.0",
 "customer_id": "1"
 }
 }
 */

import Foundation
import RealmSwift
import ObjectMapper

class OrderListDS: Object, Mappable {
    dynamic var id: Int = 1
    dynamic var os = ""
    dynamic var version = ""
    dynamic var request_time = ""
    dynamic var customer_id = ""
    dynamic var server_status = 200
    var order_list = List<OrderList>()

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
        customer_id <- map["request_context.customer_id"]
        server_status  <- map["request_context.server_status"]
        order_list <- map["order_list"]
    }
    
    func fetchOrderListData() -> OrderListDS {
        return OrderListStorage.shared.orderListData
    }
}

// Need to discuss this structure
final class OrderList: Object {
    dynamic var id: String = ""
    dynamic var text: String = ""
    dynamic var image: String = ""
}

extension OrderList: Mappable {
    convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
        image <- map["image"]
    }
}
