//
//  AppDelegate.swift
//  NALTest
//
//  Created by Van Le H. on 4/14/20.
//  Copyright © 2020 Van Le H All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let shared: AppDelegate = {
        guard let shared = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Cannot cast `UIApplication.shared.delegate` to `AppDelegate`.")
        }
        return shared
    }()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let rootVC = UserListViewController()
        let navi = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate {
    func isNetworkConnectionAvailable() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
