//
//  WineStorage.swift
//  VYNGLE
//
//  Created by Sujeet on 8/31/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import RealmSwift

class WineStorage {
    static var shared = try! WineStorage()
    var currentProductID = ""

    let realm: Realm
    
    init() throws {
        realm = try Realm()
    }
    
    var wineData: WineDS {
        do {
            guard let wineDataValue = try Realm().objects(WineDS.self).first else {
                return WineDS()
            }
            return wineDataValue
        } catch {
            print(error.localizedDescription)
            return WineDS()
        }
    }
    
    
    func saveWineData(_ wineData: WineDS) {
        do {
            try realm.write {
                realm.add(wineData, update: true)
            }
        } catch {
            print("error saveWineData detail : " + error.localizedDescription)
        }
    }
    
    func deleteWineData() {
        do {
            try realm.write {
                let wineDataValue = Array(realm.objects(WineDS.self))
                realm.delete(wineDataValue)
            }
        } catch {
            print("error deleteWineData detail : " + error.localizedDescription)
        }
    }
    
    func setCurrentProduct(productId: String) {
        self.currentProductID = productId
    }
    
    func getCurrentProduct() -> String {
        return self.currentProductID
    }

}

