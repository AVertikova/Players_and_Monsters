//
//  AppDelegate.swift
//  Players_and_Monsters
//
//  Created by Анна Вертикова on 07.10.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let homeModule = HomeBuilder.createModule()
        let navigationController = UINavigationController()
        navigationController.viewControllers = [homeModule]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
        
    }

    
}

