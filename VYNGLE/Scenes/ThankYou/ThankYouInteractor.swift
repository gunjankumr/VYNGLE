//
//  ThankYouInteractor.swift
//  VYNGLE
//
//  Created by Sujeet on 8/27/17.
//  Copyright (c) 2017 Sujeet. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ThankYouBusinessLogic
{
  func doSomething(request: ThankYou.Something.Request)
}

protocol ThankYouDataStore
{
  //var name: String { get set }
}

class ThankYouInteractor: ThankYouBusinessLogic, ThankYouDataStore
{
  var presenter: ThankYouPresentationLogic?
  var worker: ThankYouWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: ThankYou.Something.Request)
  {
    worker = ThankYouWorker()
    worker?.doSomeWork()
    
    let response = ThankYou.Something.Response()
    presenter?.presentSomething(response: response)
  }
}