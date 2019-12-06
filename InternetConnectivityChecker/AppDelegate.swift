//
//  AppDelegate.swift
//  InternetConnectivityChecker
//
//  Created by Insight Workshop on 12/6/19.
//  Copyright © 2019 Insight Workshop. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ICCManager.shared.startMonitoring()
        return true
    }

}

