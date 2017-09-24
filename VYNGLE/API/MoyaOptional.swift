//
//  MoyaOptional.swift
//  VYNGLE
//
//  Created by Sujeet on 8/25/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import Foundation
import Moya
import Alamofire

public extension TargetType {
    public var parameterEncoding: Alamofire.ParameterEncoding { return Alamofire.JSONEncoding.default }
    public var sampleData: Data { return "".data(using: .utf8)! }
    public var task: Task { return .request }
}

