//
//  SendContactUsAPI.swift
//  VYNGLE
//
//  Created by Sujeet on 8/26/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import SVProgressHUD
import SwiftyJSON

public class SendContactUsAPI {
    func sendContactUs(client: String, os_version: String, from: String, subject: String, message: String, customer_id: String, currentViewController: UIViewController, completion: @escaping (String) -> Void) {
        if !Connectivity.isConnectedToInternet {
            print("No! internet connection is not available.")
            completion(status_fail)
            CommonMethods().alertWithOneButton(title: "", errorText: "no_internet_connection".localizedCapitalized, btnTitle: "ok".localizedCapitalized, currentViewController: currentViewController)
            return;
        }
        SVProgressHUD.show(withStatus: "Searching wine database".localizedCapitalized)
            VyngleAPI.provider.request(.sendContactUs(client, os_version, from, subject, message, customer_id)){ (result) in
                SVProgressHUD.dismiss()
                switch result {
                case let .success(response):
                    let data = response.data
                    let json = JSON(data: data)
                    print("json value ", json)
                    let apiStatusCode = APIStatusCode(response: response)
                    switch(apiStatusCode) {
                    case .success:
                        print("apiStatusCode in sendContactUs", apiStatusCode)
                        completion(status_success)
                        break
                    default:
                        print("apiStatusCode in sendContactUs", apiStatusCode)
                        completion(status_fail)
                        break
                    }
                case let .failure(error):
                    print("error in sendContactUs", error)
                    completion(status_fail)
                    break
                }
            }
        }
}
