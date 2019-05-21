//
//  NotificationsHelper.swift
//  Notifications
//
//  Created by eduardo on 5/21/19.
//

import UIKit
import UserNotifications

struct NotificationsHelper {
  let notificationCenter = UNUserNotificationCenter.current()
  
  func requestNotificationPermissions(_ completion: @escaping (Bool) -> ()) {
    notificationCenter.requestAuthorization(options: [.badge, .sound, .alert]) { permissionGranted, error in
      completion(permissionGranted)
    }
  }
  
  func userHasDisabledNotifications(_ completion: @escaping (Bool) -> ()) {
    notificationCenter.getNotificationSettings { settings in
      completion(settings.authorizationStatus == .denied)
    }
  }
}
