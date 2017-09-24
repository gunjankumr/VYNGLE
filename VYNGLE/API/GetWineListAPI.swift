//
//  GetWineListAPI.swift
//  VYNGLE
//
//  Created by Sujeet on 8/26/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import SVProgressHUD
import SwiftyJSON

public class GetWineListAPI {
    func getWineList(os: String, version: String, currentViewController: UIViewController, completion: @escaping (String) -> Void) {
        if !Connectivity.isConnectedToInternet {
            print("No! internet connection is not available.")
            completion(status_fail)
            CommonMethods().alertWithOneButton(title: "", errorText: "no_internet_connection".localizedCapitalized, btnTitle: "ok".localizedCapitalized, currentViewController: currentViewController)
            return;
        }
        SVProgressHUD.show(withStatus: "Searching wine database".localizedCapitalized)

        VyngleAPI.provider.request(.getWineList(os, version)){ (result) in
            SVProgressHUD.dismiss()
            switch result {
            case let .success(response):
                let data = response.data
                let json = JSON(data: data)
                print("json value ", json)
                let apiStatusCode = APIStatusCode(response: response)
                switch(apiStatusCode) {
                case .success:
                    print("apiStatusCode in getWineList", apiStatusCode)
                    do {
                        WineStorage.shared.deleteWineData()
                        let listWineData = try response.mapObject(WineDS.self)
                        WineStorage.shared.saveWineData(listWineData)
                        print("Wine data", WineStorage.shared.wineData)
                        completion(status_success)
                    }catch {
                        completion(status_fail)
                    }
                    break
                default:
                    print("apiStatusCode in getWineList", apiStatusCode)
                    completion(status_fail)
                    break
                }
            case let .failure(error):
                print("error in getWineList", error)
                completion(status_fail)
                break
            }
        }
    }
    
    func getWineListInBackground(os: String, version: String, completion: @escaping ()->()) {
        if !Connectivity.isConnectedToInternet {
            print("No! internet connection is not available.")
            completion()
            return;
        }
        SVProgressHUD.show(withStatus: "Searching wine database".localizedCapitalized)

        VyngleAPI.provider.request(.getWineList(os, version)){ (result) in
            SVProgressHUD.dismiss()
            switch result {
            case let .success(response):
                let data = response.data
                let json = JSON(data: data)
                print("json value ", json)
                let apiStatusCode = APIStatusCode(response: response)
                switch(apiStatusCode) {
                case .success:
                    print("apiStatusCode in getWineList", apiStatusCode)
                    do {
                        WineStorage.shared.deleteWineData()
                        let listWineData = try response.mapObject(WineDS.self)
                        WineStorage.shared.saveWineData(listWineData)
                        print("Wine data", WineStorage.shared.wineData)
                        completion()
                    }catch {
                        completion()
                    }
                    break
                default:
                    print("apiStatusCode in getWineList", apiStatusCode)
                    completion()
                    break
                }
            case let .failure(error):
                print("error in getWineList", error)
                completion()
                break
            }
        }
    }

}
