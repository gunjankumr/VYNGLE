//
//  ProductAvailabilityStorage.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import RealmSwift

class ProductAvailabilityStorage {
    static var shared = try! ProductAvailabilityStorage()
    let realm: Realm
    
    init() throws {
        realm = try Realm()
    }
    
    var productAvailabilityData: ProductAvailabilityDS {
        do {
            guard let productAvailabilityValue = try Realm().objects(ProductAvailabilityDS.self).first else {
                return ProductAvailabilityDS()
            }
            return productAvailabilityValue
        } catch {
            print(error.localizedDescription)
            return ProductAvailabilityDS()
        }
    }
    
    
    func saveProductAvailabilityData(_ productAvailabilityData: ProductAvailabilityDS) {
        do {
            try realm.write {
                realm.add(productAvailabilityData, update: true)
            }
        } catch {
            print("error saveProductAvailabilityData detail : " + error.localizedDescription)
        }
    }
    
    func deleteProductAvailabilityData() {
        do {
            try realm.write {
                let productAvailabilityDataValue = Array(realm.objects(ProductAvailabilityDS.self))
                realm.delete(productAvailabilityDataValue)
            }
        } catch {
            print("error deleteProductAvailabilityData detail : " + error.localizedDescription)
        }
    }
}

