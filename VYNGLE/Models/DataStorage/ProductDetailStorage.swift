//
//  ProductDetailStorage.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import RealmSwift

class ProductDetailsStorage {
    static var shared = try! ProductDetailsStorage()
    let realm: Realm
    
    init() throws {
        realm = try Realm()
    }
    
    var productDetailsData: ProductDetailDS {
        do {
            guard let productDetailsValue = try Realm().objects(ProductDetailDS.self).first else {
                return ProductDetailDS()
            }
            return productDetailsValue
        } catch {
            print(error.localizedDescription)
            return ProductDetailDS()
        }
    }
    
    
    func saveProductDetailData(_ productDetailData: ProductDetailDS) {
        do {
            try realm.write {
                realm.add(productDetailData, update: true)
            }
        } catch {
            print("error saveProductDetailData detail : " + error.localizedDescription)
        }
    }
    
    func deleteProductDetailData() {
        do {
            try realm.write {
                let productDetailsValue = realm.objects(ProductDetailDS.self)
                realm.delete(productDetailsValue)
            }
        } catch {
            print("error deleteProductDetailData detail : " + error.localizedDescription)
        }
    }
}

