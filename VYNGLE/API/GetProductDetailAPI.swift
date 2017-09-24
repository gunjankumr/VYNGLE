//
//  GetProductDetailAPI.swift
//  VYNGLE
//
//  Created by Sujeet on 8/26/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import SVProgressHUD
import SwiftyJSON

public class GetProductDetailAPI {
    func getProductDetail(os: String, version: String, productId: String, currentViewController: UIViewController, completion: @escaping (String) -> Void) {
        if !Connectivity.isConnectedToInternet {
            print("No! internet connection is not available.")
            completion(status_fail)
            CommonMethods().alertWithOneButton(title: "", errorText: "no_internet_connection".localizedCapitalized, btnTitle: "ok".localizedCapitalized, currentViewController: currentViewController)
            return;
        }
        SVProgressHUD.show(withStatus: "Searching wine database".localizedCapitalized)

            VyngleAPI.provider.request(.getProductDetail(os, version, productId)){ (result) in
                SVProgressHUD.dismiss()
                switch result {
                case let .success(response):
                    let data = response.data
                    let json = JSON(data: data)
                    print("json value ", json)
                    let apiStatusCode = APIStatusCode(response: response)
                    switch(apiStatusCode) {
                    case .success:
                        print("apiStatusCode in getProductDetail", apiStatusCode)
                        do {
                            ProductDetailsStorage.shared.deleteProductDetailData()
                            let productDetailData = try response.mapObject(ProductDetailDS.self)
                            ProductDetailsStorage.shared.saveProductDetailData(productDetailData)
                            print("ProductDetailsStorage", ProductDetailsStorage.shared.productDetailsData)
                            completion(status_success)
                        }catch {
                            completion(status_fail)
                        }
                        break
                    default:
                        print("apiStatusCode in getProductDetail", apiStatusCode)
                        completion(status_fail)
                        break
                    }
                case let .failure(error):
                    print("error in getProductDetail", error)
                    completion(status_fail)
                    break
                }
            }
        }
}
