//
//  AppDelegate.swift
//  DENTIST MANAGER
//
//  Created by MAKAR4IK BOND on 15.02.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var userKey: String = "userData"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = self.window {
            let navigationController = UINavigationController()
            
            let person = TBFileManager.shared.unArchiveWithNSCoding(with: self.userKey)
            if person?.name == nil {
            navigationController.viewControllers = [LoginPage()]
                window.rootViewController = navigationController
                navigationController.isNavigationBarHidden = true
                window.makeKeyAndVisible()
            } else {
                navigationController.viewControllers = [TabBar()]
                    window.rootViewController = navigationController
                    navigationController.isNavigationBarHidden = true
                    window.makeKeyAndVisible()
            }
            
        }
        return true
    }
    
    

}

