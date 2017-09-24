//
//  ServiceConfiguration.swift
//  VYNGLE
//
//  Created by Sujeet on 8/25/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import Moya_ObjectMapper


class TrustAllSitePolicyManager: ServerTrustPolicyManager {
    convenience init() {
        self.init(policies: [:])
    }
    
    override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
        return ServerTrustPolicy.disableEvaluation
    }
}

//enum VyngleAPI {
//    case getWineList(String, String)
//    case getProductDetail(String, String, String)
//    case getProductAvailability(String, String, String, String)
//    case getLegalInformation(String, String)
//    case sendContactUs(String, String, String, String, String, String)
//    case getOrderList(String, String, String)
//    
//    static var provider: VyngleAPIProvider<VyngleAPI> = {
//        let trustManager = TrustAllSitePolicyManager()
//        let manager = Manager(configuration: .default, serverTrustPolicyManager: trustManager)
//        let provider = VyngleAPIProvider<VyngleAPI>(manager: manager, plugins: [NetworkLoggerPlugin()])
//        return provider
//    }()
//}

enum VyngleAPI {
    case getWineList(String, String)
    case getProductDetail(String, String, String)
    case getProductAvailability(String, String, String, String)
    case getLegalInformation(String, String)
    case sendContactUs(String, String, String, String, String, String)
    case getOrderList(String, String, String)

    static var provider: MoyaProvider<VyngleAPI> = {
        let trustManager = TrustAllSitePolicyManager()
        let manager = Manager(configuration: .default, serverTrustPolicyManager: trustManager)
        let endpoint = { (target: VyngleAPI) -> Endpoint<VyngleAPI> in
            var urlString = url(for: target).absoluteString
            return Endpoint(
                url: urlString.removingPercentEncoding ?? urlString,
                sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                method: target.method,
                parameters: target.parameters,
                parameterEncoding: target.parameterEncoding
            )
        }
        let provider = MoyaProvider<VyngleAPI>(endpointClosure:endpoint, manager: manager, plugins: [NetworkLoggerPlugin(verbose:true)])
        return provider
    }()
    
    private static func url(for target: VyngleAPI) -> URL {
        if target.path.isEmpty {
            return target.baseURL
        }
        
        return target.baseURL.appendingPathComponent(target.path)
    }
}



extension VyngleAPI: TargetType {
    
    public var baseURL: URL { return URL(string: GlobalAPI.environment.baseURL)! }
    public var path: String {
        switch self {
        case .getWineList:
            return "vyngle.php?f=getWineList"
        case .getProductDetail:
            return "vyngle.php?f=getProductDetail"
        case .getProductAvailability:
            return "vyngle.php?f=getProductAvailability"
        case .getLegalInformation:
            return "vyngle.php?f=getLegalInformation"
        case .sendContactUs:
            return "vyngle.php?f=sendContactUs"
        case .getOrderList:
            return "vyngle.php?f=getOrderList"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getWineList, .getProductDetail, .getProductAvailability, .getLegalInformation, .sendContactUs, .getOrderList:
            return .post
//        case .getWineList, .getProductDetail, .getProductAvailability, .getLegalInformation, .sendContactUs, .getOrderList:
//            return .get
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case let .getWineList(os, version):
            return ["os": os,
                    "version": version]
        case let .getProductDetail(os, version, product_id):
            return ["os": os,
                    "version": version,
                    "product_id": product_id]
        case let .getProductAvailability(os, version, product_id, order_quantity_in_bottles):
            return ["os":os,
                    "version":version,
                    "product_id":product_id,
                    "order_quantity_in_bottles":order_quantity_in_bottles]
        case let .getLegalInformation(os, version):
            return ["os":os,
                    "version":version]
        case let .sendContactUs(client, os_version, from, subject, message, customer_id):
            return ["client": client,
                    "os_version": os_version,
                    "from": from,
                    "subject": subject,
                    "message": message,
                    "customer_id":customer_id]
        case let .getOrderList(os, version, customer_id):
            return ["os": os,
                    "version": version,
                    "customer_id": customer_id]
        }
        
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    public var task: Task {
        return .request
    }
    public var sampleData: Data {
        return "".data(using: .utf8)!
    }
}


public struct CustomJSONEncoding: ParameterEncoding {
    
    // MARK: Properties
    
    /// Returns a `JSONEncoding` instance with default writing options.
    public static var `default`: CustomJSONEncoding { return CustomJSONEncoding() }
    
    /// Returns a `JSONEncoding` instance with `.prettyPrinted` writing options.
    public static var prettyPrinted: CustomJSONEncoding { return CustomJSONEncoding(options: .prettyPrinted) }
    
    /// The options for writing the parameters as JSON data.
    public let options: JSONSerialization.WritingOptions
    
    // MARK: Initialization
    
    /// Creates a `JSONEncoding` instance using the specified options.
    ///
    /// - parameter options: The options for writing the parameters as JSON data.
    ///
    /// - returns: The new `JSONEncoding` instance.
    public init(options: JSONSerialization.WritingOptions = []) {
        self.options = options
    }
    
    // MARK: Encoding
    
    /// Creates a URL request by encoding parameters and applying them onto an existing request.
    ///
    /// - parameter urlRequest: The request to have parameters applied.
    /// - parameter parameters: The parameters to apply.
    ///
    /// - throws: An `Error` if the encoding process encounters an error.
    ///
    /// - returns: The encoded request.
    public func encode(_ _urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try _urlRequest.asURLRequest()
        if let urlString = urlRequest.url?.absoluteString.removingPercentEncoding {
            urlRequest.url = URL(string: urlString)
        }
        guard let parameters = parameters else { return urlRequest }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: options)
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
            urlRequest.httpBody = data
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        
        return urlRequest
    }
    
    /// Creates a URL request by encoding the JSON object and setting the resulting data on the HTTP body.
    ///
    /// - parameter urlRequest: The request to apply the JSON object to.
    /// - parameter jsonObject: The JSON object to apply to the request.
    ///
    /// - throws: An `Error` if the encoding process encounters an error.
    ///
    /// - returns: The encoded request.
    public func encode(_ urlRequest: URLRequestConvertible, withJSONObject jsonObject: Any? = nil) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        guard let jsonObject = jsonObject else { return urlRequest }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: options)
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
            urlRequest.httpBody = data
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        
        return urlRequest
    }
}

public enum APIStatusCode: String {
    
    case unknown
    case success = "200"
    case fail = "300"

    var value: String {
        return rawValue
    }
    
    init(response: Moya.Response) {
        do {
            let errorResult = try response.mapObject(ErrorResult.self)
            guard let apiStatus = APIStatusCode(rawValue: errorResult.error) else {
                self = .unknown
                return
            }
            self = apiStatus
        } catch {
            guard let apiStatus = APIStatusCode(rawValue: "\(response.statusCode)") else {
                self = .unknown
                return
            }
            self = apiStatus
        }
    }
    
}
