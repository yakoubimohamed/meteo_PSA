//
//  MeteoPresenter.swift
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

protocol MeteoPresentationLogic
{
    func presentMeteoData(response: Meteo)
    func presentFetchError(error: Error)
}

class MeteoPresenter: MeteoPresentationLogic
{
 
  weak var viewController: MeteoDisplayLogic?
  
  // MARK: present Meteo Data
    
    func presentMeteoData(response: Meteo) {
        viewController?.displayMeteoData(viewModel: response)
    }
    
    func presentFetchError(error: Error) {
        viewController?.displayError(error: error)
    }
    
  
}