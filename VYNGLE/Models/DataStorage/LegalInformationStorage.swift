//
//  LegalInformationStorage.swift
//  VYNGLE
//
//  Created by Sujeet on 9/3/17.
//  Copyright © 2017 VYNGLE. All rights reserved.
//

import RealmSwift

class LegalInformationStorage {
    static var shared = try! LegalInformationStorage()
    let realm: Realm
    
    init() throws {
        realm = try Realm()
    }
    
    var legalInformationData: LegalInformationDS {
        do {
            guard let legalInformationValue = try Realm().objects(LegalInformationDS.self).first else {
                return LegalInformationDS()
            }
            return legalInformationValue
        } catch {
            print(error.localizedDescription)
            return LegalInformationDS()
        }
    }
    
    
    func saveLegalInformationData(_ legalInformationData: LegalInformationDS) {
        do {
            try realm.write {
                realm.add(legalInformationData, update: true)
            }
        } catch {
            print("error saveLegalInformationData detail : " + error.localizedDescription)
        }
    }
    
    func deleteLegalInformationData() {
        do {
            try realm.write {
                let legalInformationDataValue = Array(realm.objects(LegalInformationDS.self))
                realm.delete(legalInformationDataValue)
            }
        } catch {
            print("error deleteLegalInformationData detail : " + error.localizedDescription)
        }
    }
}

