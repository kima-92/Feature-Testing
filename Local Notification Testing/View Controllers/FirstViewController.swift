//
//  FirstViewController.swift
//  Local Notification Testing
//
//  Created by macbook on 9/2/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit
import UserNotifications

class FirstViewController: UIViewController {
    
    // MARK: - Properties
    
    var notificationCenter = UNUserNotificationCenter.current()
    var notificationsCounter = 0
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        requestPermission()
    }
    
    // MARK: - Methods
    
    // Request Permission from the User to send Notifications from this App
    private func requestPermission() {
        notificationCenter.requestAuthorization(options: [[.alert, .sound, .badge]], completionHandler: {(granted, error) in
            print("There was an error requesting authorization")
        })
    }
    
    // Button
    private func createButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        button.setTitle("Get Notification", for: .normal)
        button.addTarget(self, action: #selector(getNotification), for: .touchUpInside)
        button.center = view.center
        view.addSubview(button)
    }
    
    // Creating the Notification
    @objc private func getNotification(sender: UIButton) {
        
        // A Notification needs 3 things:
        
        // 1. Content
        let content = UNMutableNotificationContent()
        content.title = "Swift Reminder"
        content.body = "Don't forget to brush up on your Swift Skills!"
        
        // Counter of how many notifications this app has
        notificationsCounter += 1
        let counter = NSNumber(integerLiteral: notificationsCounter)
        content.badge = counter
        
        // 2. Trigger
        // This sets the Trigger to show the notification after 10 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        // 3. Request Notification
        let requestIdentifier = UUID().uuidString
        
        // Setting up the Notification:
        
        // Create the Notification Request
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        // Add the Notification to the Notification Center
        notificationCenter.add(request, withCompletionHandler: {(error) in
            print("There was an error")
        })
    }
}
