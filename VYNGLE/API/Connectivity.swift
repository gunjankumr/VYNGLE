//
//  Connectivity.swift
//  VYNGLE
//
//  Created by Sujeet on 8/25/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

