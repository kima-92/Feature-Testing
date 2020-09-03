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
            
            // Grated is a Bool of whether or not the user gave you permission
            
            if let error = error {
                print("There was an error requesting authorization: \(error)")
            }
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
        
        // a) This Trigger sets the Notification to show up after 10 seconds of pushing the button
        let triggerByTimeIntvl = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        // c) This Trigger sets the Notification to show up at a specified Time & Date
        let dateString = "03/09/2020 12:45"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let dateFromString = dateFormatter.date(from: dateString)
        
        // Components of this Date
        let componentsFromDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dateFromString!)
        // trigger
        let triggerDate = UNCalendarNotificationTrigger(dateMatching: componentsFromDate, repeats: false)
        
        // b) This Trigger ALSO sets the Notification to show up after 10 seconds, but using the UNCalendarNotificationTrigger intead of UNTimeIntervalNotificationTrigger
        let dateByTimeIntvl = Date().addingTimeInterval(10)
        
        let dateComponentsByTimeIntvl = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateByTimeIntvl)
        
        let secondTriggerTimeIntvl = UNCalendarNotificationTrigger(dateMatching: dateComponentsByTimeIntvl, repeats: false)
        
        // 3. Request Identifier
        
        let requestIdentifier = UUID().uuidString
        
        
        // MARK: - Notification Request :
        
        // 1. Create the Notification Request
        
        //      a) With a Time Interval Trigger
        //let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: triggerByTimeIntvl)
        
        //      b) With a Date Trigger
        //let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: triggerDate)
        
        //      c) With a Date Trigger, for a TimeInterval type Trigger
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: secondTriggerTimeIntvl)
        
        // 2. Add the Notification Request to the Notification Center
        notificationCenter.add(request) { (error) in
            
            if let error = error {
                print("There was an error creating the Notification: \(error)")
            }
        }
    }
}
