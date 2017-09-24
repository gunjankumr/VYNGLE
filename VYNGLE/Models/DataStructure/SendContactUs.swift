//
//  SendContactUs.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import Foundation
/*
 {
 "response": "Email sent successfully!",
 "request_context": {
 "request_time": "2017-09-02 17:34:16",
 "client": "iOS",
 "os_version": "10",
 "from": "ranjandeo@gmail.com",
 "subject": "Hello",
 "message": "It is a test mail",
 "customer_id": "0"
 }
 }
 */

import Foundation
import RealmSwift
import ObjectMapper

class SendContactUsDS: Object, Mappable {
    dynamic var id: Int = 1
    dynamic var request_time = ""
    dynamic var client = ""
    dynamic var os_version = ""
    dynamic var from = ""
    dynamic var subject = ""
    dynamic var message = ""
    dynamic var customer_id = ""
    dynamic var response = ""
    dynamic var server_status = 200

    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        request_time  <- map["request_context.request_time"]
        client  <- map["request_context.client"]
        os_version  <- map["request_context.os_version"]
        from  <- map["request_context.from"]
        subject  <- map["request_context.subject"]
        message  <- map["product_availability.message"]
        customer_id  <- map["request_context.customer_id"]
        server_status  <- map["request_context.server_status"]
        response  <- map["response"]
    }
    
    func fetchSendContactUsData() -> SendContactUsDS {
        return SendContactUsStorage.shared.sendContactUsData
    }
}
