//
//  APIConfiguration.swift
//  Meteo App
//
//  Created by Yakoubi Mohammed on 25/8/2022.
//

import Foundation
import Alamofire
protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

