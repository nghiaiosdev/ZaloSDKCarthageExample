//
//  AppDelegate.swift
//  ZaloCarthageExample
//
//  Created by Nguyen Van Nghia on 5/12/20.
//  Copyright © 2020 Nguyen Van Nghia. All rights reserved.
//

import UIKit
import ZaloSDKCoreKit
import ZaloSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ZaloSDK.sharedInstance()?.initialize(withAppId: "4203078980754047762")
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ZDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
    }
}

