//
//  AppDelegate.swift
//  SurveySystem
//
//  Created by Eyad Shokry on 2/2/21.
//  Copyright © 2021 Eyad Shokry. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        UserDefaults.standard.set(false, forKey: "isLoggedIn")
//        if(UserDefaults.standard.bool(forKey: "isLoggedIn") == true) {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let homeVC = storyboard.instantiateViewController(identifier: "Onboarding")
//            self.window?.rootViewController = homeVC
//        }
//        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 24/255, green: 26/255, blue: 32/255, alpha: 1.0)
//        UINavigationBar.appearance().tintColor = UIColor.white
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
//        UINavigationBar.appearance().shadowImage = UIImage()

        IQKeyboardManager.shared.enable = true
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

