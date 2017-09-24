//
//  GetProductAvailabilityAPI.swift
//  VYNGLE
//
//  Created by Sujeet on 8/26/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import SVProgressHUD
import SwiftyJSON

public class GetProductAvailabilityAPI {
    func getProductAvailability(os: String, version: String, product_id: String, order_quantity_in_bottles: String, currentViewController: UIViewController, completion: @escaping (String) -> Void) {
        if !Connectivity.isConnectedToInternet {
            print("No! internet connection is not available.")
            completion(status_fail)
            CommonMethods().alertWithOneButton(title: "", errorText: "no_internet_connection".localizedCapitalized, btnTitle: "ok".localizedCapitalized, currentViewController: currentViewController)
            return;
        }
        SVProgressHUD.show(withStatus: "Searching wine database".localizedCapitalized)

            VyngleAPI.provider.request(.getProductAvailability(os, version, product_id, order_quantity_in_bottles)){ (result) in
                SVProgressHUD.dismiss()
                switch result {
                case let .success(response):
                    let data = response.data
                    let json = JSON(data: data)
                    print("json value ", json)
                    let apiStatusCode = APIStatusCode(response: response)
                    switch(apiStatusCode) {
                    case .success:
                        print("apiStatusCode in getProductAvailability", apiStatusCode)
                        completion(status_success)
                        break
                    default:
                        print("apiStatusCode in getProductAvailability", apiStatusCode)
                        completion(status_fail)
                        break
                    }
                case let .failure(error):
                    print("error in getProductAvailability", error)
                    completion(status_fail)
                    break
                }
            }
        }
}
