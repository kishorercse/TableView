//
//  AppDelegate.swift
//  TableView
//
//  Created by kishore-pt5557 on 12/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navController = UINavigationController(rootViewController: ViewController())
        navController.setNavigationBarHidden(false, animated: true)
        navController.navigationBar.tintColor = .black
        window?.rootViewController = navController
        return true
    }


}

