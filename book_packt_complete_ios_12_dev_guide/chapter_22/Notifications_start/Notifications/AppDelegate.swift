import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    if let tabBar = window?.rootViewController as? UITabBarController {
      for viewController in tabBar.viewControllers ?? [] {
        if var vc = viewController as? PersistentContainerRequiring {
          vc.persistentContainer = PersistentHelper.persistentContainer
        }
      }
    }

    return true
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    UIApplication.shared.registerForRemoteNotifications()
  }
  
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    print("received device token: \(deviceToken)")
  }
  
  func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("Did not register for remote notifications: \(error.localizedDescription)")
  }
  
}

