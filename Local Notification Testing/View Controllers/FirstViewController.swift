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
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        requestPermission()
    }
    
    // MARK: - Methods
    
    // Request Permission from the User to send Notifications from this App
    private func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [[.alert, .sound, .badge]], completionHandler: {(granted, Error) in
            print("There was an error requesting authorization")
        })
    }
    
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
        content.badge = 1  // Counter of how many notifications this app has
        
        // 2. Trigger
        // This sets the Trigger to show the notification after 10 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        // 3. Request Notification
        let requestIdentifier = UUID().uuidString
        
        // Setting up the Notification:
        
        // Create the Notification Request
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        // Add the Notification to the Notification Center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {(error) in
            print("There was an error")
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
