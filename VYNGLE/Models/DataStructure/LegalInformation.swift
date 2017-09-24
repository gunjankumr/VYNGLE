//
//  LegalInformation.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import Foundation
/*
 
 {
 "legal_information": [
 {
 "id": 1,
 "text": "Legal information text1"
 },
 {
 "id": 2,
 "text": "Legal information text2"
 }
 ],
 "request_context": {
 "request_time": "2017-09-02 17:26:50",
 "os": "iOS",
 "version": "10"
 }
 }
 
 */

import Foundation
import RealmSwift
import ObjectMapper

class LegalInformationDS: Object, Mappable {
    dynamic var id: Int = 1
    dynamic var os = ""
    dynamic var version = ""
    dynamic var request_time = ""
    dynamic var server_status = 200
    var legal_information = List<LegalInformation>()
    
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
        legal_information  <- map["legal_information"]
    }
    
    func fetchLegalInformationData() -> LegalInformationDS {
        return LegalInformationStorage.shared.legalInformationData
    }
}

final class LegalInformation: Object {
    dynamic var id: String = ""
    dynamic var text: String = ""
}

extension LegalInformation: Mappable {
    convenience init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        id <- map["id"]
        text <- map["text"]
    }
}



