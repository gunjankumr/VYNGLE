//
//  WinePresenter.swift
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

protocol WinePresentationLogic
{
  func presentSomething(_ response: Wine.Something.Response)
}

class WinePresenter: WinePresentationLogic
{
  weak var viewController: WineDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(_ response: Wine.Something.Response)
  {
    let viewModel = Wine.Something.ViewModel()
    viewController?.displaySomething(viewModel)
  }
}
