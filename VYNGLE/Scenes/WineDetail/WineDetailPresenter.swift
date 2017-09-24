//
//  WineDetailPresenter.swift
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

protocol WineDetailPresentationLogic
{
  func presentSomething(_ response: WineDetail.Something.Response)
}

class WineDetailPresenter: WineDetailPresentationLogic
{
  weak var viewController: WineDetailDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(_ response: WineDetail.Something.Response)
  {
    let viewModel = WineDetail.Something.ViewModel()
    viewController?.displaySomething(viewModel)
  }
}
