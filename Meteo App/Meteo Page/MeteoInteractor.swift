//
//  MeteoInteractor.swift
//  Meteo App
//
//  Created by Yakoubi Mohammed on 25/8/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MeteoBusinessLogic
{
    func getMeteoData(localName : String)
}

protocol MeteoDataStore
{

}

class MeteoInteractor: MeteoBusinessLogic, MeteoDataStore
{
    
    
  var presenter: MeteoPresentationLogic?
  var worker: MeteoWorker?
  // MARK: get Meteo Data
    func getMeteoData(localName: String) {
        worker = MeteoWorker()
          self.worker?.getData(localName: localName)
            .then { meteoData in
                self.presenter?.presentMeteoData(response: meteoData)
            }.catch {error in
                print(error)
                self.presenter?.presentFetchError(error: error)
            }
    }
}
