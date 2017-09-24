//
//  MyAccountInteractor.swift
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

protocol MyAccountBusinessLogic
{
  func doSomething(request: MyAccount.Something.Request)
}

protocol MyAccountDataStore
{
  //var name: String { get set }
}

class MyAccountInteractor: MyAccountBusinessLogic, MyAccountDataStore
{
  var presenter: MyAccountPresentationLogic?
  var worker: MyAccountWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: MyAccount.Something.Request)
  {
    worker = MyAccountWorker()
    worker?.doSomeWork()
    
    let response = MyAccount.Something.Response()
    presenter?.presentSomething(response: response)
  }
}