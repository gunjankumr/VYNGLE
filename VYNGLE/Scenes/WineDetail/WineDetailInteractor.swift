//
//  WineDetailInteractor.swift
//  VYNGLE
//
//  Created by Sujeet on 8/21/17.
//  Copyright (c) 2017 Sujeet. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol WineDetailBusinessLogic
{
  func doSomething(_ request: WineDetail.Something.Request)
}

protocol WineDetailDataStore
{
  //var name: String { get set }
}

class WineDetailInteractor: WineDetailBusinessLogic, WineDetailDataStore
{
  var presenter: WineDetailPresentationLogic?
  var worker: WineDetailWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(_ request: WineDetail.Something.Request)
  {
    worker = WineDetailWorker()
    worker?.doSomeWork()
    
    let response = WineDetail.Something.Response()
    presenter?.presentSomething(response)
  }
}
