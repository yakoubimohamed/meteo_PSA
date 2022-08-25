//
//  MeteoAPIClient.swift
//  Meteo App
//
//  Created by Yakoubi Mohammed on 25/8/2022.
//

import Foundation
import Alamofire
import Promises
class MeteoAPIClient: APIClient {
    static func getMeteo(localName: String) -> Promise<Meteo> {
        return performRequest(route: MeteoEndpoint.getData(localName: localName))
    }
}
