//
//  APIClient.swift
//  Meteo App
//
//  Created by Yakoubi Mohammed on 25/8/2022.
//

import Foundation
import Alamofire
import Promises
open class APIClient {
    @discardableResult
    static func performRequest<T: Decodable>(route: APIConfiguration, decoder: JSONDecoder = JSONDecoder())->Promise<T> {
        return Promise<T> { fulfill, reject in
            AF.request(route).responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                print(response.response?.statusCode)
                switch response.result {
                case .success(let value):

                    fulfill(value)
                case .failure(let error):
                    reject(error)
                }
            })
        }
    }
    @discardableResult
    static func performFullResponseRequest(route: APIConfiguration) -> Promise<DataResponse<Data?, AFError>> {
        return Promise<DataResponse<Data?, AFError>> { fulfill, reject in
            AF.request(route).response( completionHandler: { (response: DataResponse<Data?, AFError>) in
                print(response.response?.statusCode)
                switch response.result {
                case .success:

                    fulfill(response)
                case .failure(let error):
                    reject(error)
                }
            })
        }
    }
    @discardableResult
    static func performDownloadRequest(route: APIConfiguration, interceptor: RequestInterceptor?, destination: DownloadRequest.Destination?) -> Promise<DownloadResponse<Data, AFError>> {
        return Promise<DownloadResponse<Data, AFError>> { fulfill, reject in
            AF.download(route, interceptor: interceptor, to: destination).responseData(completionHandler: { response in
                switch response.result {
                case .success:
                    fulfill(response)
                case .failure(let error):
                    reject(error)
                }
            })
        }
    }
    @discardableResult
    static func performUploadRequest<T: Decodable>(route: APIConfiguration, multipartFormData: MultipartFormData, decoder: JSONDecoder = JSONDecoder())->Promise<T> {
        return Promise<T> { fulfill, reject in
            AF.upload(multipartFormData: multipartFormData, with: route).uploadProgress { progress in
                let percentage = Float(progress.fractionCompleted) / Float(1.0)

                let value: Int = Int((Float(progress.fractionCompleted) / Float(1.0)) * 100)
                var stringValue: String = String(value.description.suffix(3))
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "uploadImageProgress"), object: stringValue)
            }.responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                print(response.response?.statusCode)
                switch response.result {
                case .success(let value):
                    fulfill(value)
                case .failure(let error):
                    reject(error)
                }
            }
            )}
    }
    @discardableResult
    static func performUploadRequestIndex<T: Decodable>(route: APIConfiguration, multipartFormData: MultipartFormData,index: Int, decoder: JSONDecoder = JSONDecoder())->Promise<T> {
        return Promise<T> { fulfill, reject in
            AF.upload(multipartFormData: multipartFormData, with: route).uploadProgress { progress in
                let percentage = Float(progress.fractionCompleted) / Float(1.0)

                let value: Int = Int((Float(progress.fractionCompleted) / Float(1.0)) * 100)
                var stringValue: String = String(value.description.suffix(3))
                let indexItem = [index:stringValue]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "uploadImageProgress"), object: indexItem)
            }.responseDecodable(decoder: decoder, completionHandler: { (response: DataResponse<T, AFError>) in
                print(response.response?.statusCode)
                switch response.result {
                case .success(let value):
                    fulfill(value)
                case .failure(let error):
                    reject(error)
                }
            }
            )}
    }
}

