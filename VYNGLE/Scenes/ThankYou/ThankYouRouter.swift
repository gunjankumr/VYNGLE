//
//  ThankYouRouter.swift
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

@objc protocol ThankYouRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ThankYouDataPassing
{
  var dataStore: ThankYouDataStore? { get }
}

class ThankYouRouter: NSObject, ThankYouRoutingLogic, ThankYouDataPassing
{
  weak var viewController: ThankYouViewController?
  var dataStore: ThankYouDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: ThankYouViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ThankYouDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
