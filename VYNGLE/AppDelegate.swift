//
//  AppDelegate.swift
//  VYNGLE
//
//  Created by Sujeet on 8/27/17.
//  Copyright © 2017 Sujeet. All rights reserved.
//

import UIKit
import IQKeyboardManager
import FBSDKCoreKit
import UserNotifications
import SVProgressHUD
import SwiftyJSON



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared().toolbarPreviousNextAllowedClasses.add(UIStackView.self)
        self.updateWineList()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        self.updateWineList()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    func updateWineList() {
        let systemVersion = UIDevice.current.systemVersion
        GetWineListAPI().getWineListInBackground(os: os, version: systemVersion, completion: {
            
        })
    }
}
