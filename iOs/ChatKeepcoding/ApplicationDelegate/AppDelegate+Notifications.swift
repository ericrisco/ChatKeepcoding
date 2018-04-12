//
//  AppDelegate+Notifications.swift
//  ChatKeepcoding
//
//  Created by Eric Risco de la Torre on 12/04/2018.
//  Copyright © 2018 ERISCO. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import Firebase
import FirebaseMessaging

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func registerForPushNotifications(_ application: UIApplication){
        
        if #available(iOS 10.0, *){
            
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { ( _ , _ ) in})
            
        } else {
            
            let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
            
        }
        
        application.registerForRemoteNotifications()
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().subscribe(toTopic: "ALL")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){
        processNotification(notification)
        completionHandler(.badge)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void){
        processNotification(response.notification)
        completionHandler()
    }
    
    private func processNotification(_ notification: UNNotification) {
        //FUTURO ERIC
    }
    
}
