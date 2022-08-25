//
//  welcomeInteractor.swift
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

protocol welcomeBusinessLogic
{
  func doSomething(request: welcome.Something.Request)
}

protocol welcomeDataStore
{
  //var name: String { get set }
}

class welcomeInteractor: welcomeBusinessLogic, welcomeDataStore
{
  var presenter: welcomePresentationLogic?
  var worker: welcomeWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: welcome.Something.Request)
  {
    worker = welcomeWorker()
    worker?.doSomeWork()
    
    let response = welcome.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
