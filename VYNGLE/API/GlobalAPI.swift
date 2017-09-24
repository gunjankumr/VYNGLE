//
//  GlobalAPI.swift
//  VYNGLE
//
//  Created by Sujeet on 8/25/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

public class GlobalAPI {
    public static var environment = Environment.prod
    
    public enum Environment {
        case dev
        case prod
        
        public var baseURL: String {
            switch self {
            case .dev:
                return "http://www.vyngle.com/api"
            case .prod:
                return "http://www.vyngle.com/api"
            }
        }
    }
    
}
