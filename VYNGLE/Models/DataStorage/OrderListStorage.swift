//
//  OrderListStorage.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import RealmSwift

class OrderListStorage {
    static var shared = try! OrderListStorage()
    let realm: Realm
    
    init() throws {
        realm = try Realm()
    }
    
    var orderListData: OrderListDS {
        do {
            guard let orderListValue = try Realm().objects(OrderListDS.self).first else {
                return OrderListDS()
            }
            return orderListValue
        } catch {
            print(error.localizedDescription)
            return OrderListDS()
        }
    }
    
    
    func saveOrderListData(_ orderListData: OrderListDS) {
        do {
            try realm.write {
                realm.add(orderListData, update: true)
            }
        } catch {
            print("error saveOrderListData detail : " + error.localizedDescription)
        }
    }
    
    func deleteOrderListData() {
        do {
            try realm.write {
                let orderListValue = Array(realm.objects(OrderListDS.self))
                realm.delete(orderListValue)
            }
        } catch {
            print("error deleteOrderListData detail : " + error.localizedDescription)
        }
    }
}

