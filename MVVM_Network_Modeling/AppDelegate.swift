//
//  AppDelegate.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let tvc = UITabBarController()
        let vc1 = HomeVC()
        let vc2 = MatchingVC()
        let vc3 = ProfileEditingTableVC()
        let nvc1 = UINavigationController(rootViewController: vc1)
        let nvc3 = UINavigationController(rootViewController: vc3)
        
        vc1.tabBarItem = UITabBarItem(title: "탭1", image: #imageLiteral(resourceName: "ic_3"), tag: 0)
        vc2.tabBarItem = UITabBarItem(title: "탭2", image: #imageLiteral(resourceName: "ic_2"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "탭3", image: #imageLiteral(resourceName: "ic_1"), tag: 2)
        tvc.setViewControllers([nvc1, vc2, nvc3], animated: true)
        window?.rootViewController = tvc
        window?.makeKeyAndVisible()
        return true
    }
}

