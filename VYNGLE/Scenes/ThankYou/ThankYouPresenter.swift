//
//  ThankYouPresenter.swift
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

protocol ThankYouPresentationLogic
{
  func presentSomething(response: ThankYou.Something.Response)
}

class ThankYouPresenter: ThankYouPresentationLogic
{
  weak var viewController: ThankYouDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: ThankYou.Something.Response)
  {
    let viewModel = ThankYou.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
