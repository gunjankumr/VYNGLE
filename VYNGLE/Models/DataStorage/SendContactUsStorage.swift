//
//  SendContactUsStorage.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import RealmSwift

class SendContactUsStorage {
    static var shared = try! SendContactUsStorage()
    let realm: Realm
    
    init() throws {
        realm = try Realm()
    }
    
    var sendContactUsData: SendContactUsDS {
        do {
            guard let sendContactUsDataValue = try Realm().objects(SendContactUsDS.self).first else {
                return SendContactUsDS()
            }
            return sendContactUsDataValue
        } catch {
            print(error.localizedDescription)
            return SendContactUsDS()
        }
    }
    
    
    func saveSendContactUsDataData(_ sendContactUsData: SendContactUsDS) {
        do {
            try realm.write {
                realm.add(sendContactUsData, update: true)
            }
        } catch {
            print("error saveSendContactUsData detail : " + error.localizedDescription)
        }
    }
    
    func deleteSendContactUsData() {
        do {
            try realm.write {
                let sendContactUsValue = Array(realm.objects(SendContactUsDS.self))
                realm.delete(sendContactUsValue)
            }
        } catch {
            print("error deleteSendContactUsData detail : " + error.localizedDescription)
        }
    }
}

