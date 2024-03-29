//
//  ScheduleDeliveryPresenter.swift
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

protocol ScheduleDeliveryPresentationLogic
{
  func presentSomething(response: ScheduleDelivery.Something.Response)
}

class ScheduleDeliveryPresenter: ScheduleDeliveryPresentationLogic
{
  weak var viewController: ScheduleDeliveryDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: ScheduleDelivery.Something.Response)
  {
    let viewModel = ScheduleDelivery.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
