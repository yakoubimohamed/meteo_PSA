//
//  MeteoEndpoint.swift
//  Meteo App
//
//  Created by Yakoubi Mohammed on 25/8/2022.
//

import Foundation
import Alamofire
enum MeteoEndpoint: APIConfiguration {
    case getData(localName: String)
    
    var method: HTTPMethod{
        switch self {
            case .getData:
                return .get
            default:
                return .post
        }
    }
    var path: String {
        switch self {
            case .getData:
                return "clinetTenant"
        }
    }
    
    var parameters: Parameters?{
        switch self {
            default:
                return nil
        }
        
    }
    
    func asURLRequest() throws -> URLRequest {
        var url : URL
        switch self {
            case .getData(let localName):
                url = try ("http://api.openweathermap.org/data/2.5/weather?q=" + localName + "&units=metric&APPID=57b1eed887862a95f31637df93dba03b").asURL()
            default:
                url = try ("api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=57b1eed887862a95f31637df93dba03b").asURL()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 60
        return urlRequest
    }
    
    
}
