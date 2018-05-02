//
//  AppDelegate.swift
//  weather
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if !shouldContinue() { return false }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewControllerFactory().makeInitialViewController()
        window?.makeKeyAndVisible()

        return true
    }

    private func shouldContinue() -> Bool {
        #if DEBUG
            return NSClassFromString("XCTestCase") == nil
        #else
            return true
        #endif
    }
}
