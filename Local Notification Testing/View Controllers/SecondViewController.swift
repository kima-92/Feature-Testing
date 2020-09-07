//
//  SecondViewController.swift
//  Local Notification Testing
//
//  Created by macbook on 9/7/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit
import UserNotifications

class SecondViewController: UIViewController {
    
    // MARK: - Properties
    
    var notificationCenter = UNUserNotificationCenter.current()
    var notificationsCounter = 0
    var id = ""
    var notificationsByIDs: [String] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var notification10secButton: UIButton!
    @IBOutlet weak var resetNotificationButton: UIButton!
    
    @IBOutlet weak var deletePendingNotificationsButton: UIButton!
    @IBOutlet weak var deleteDeliveredNotificationsButton: UIButton!
    
    // MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func notification10secButtonTapped(_ sender: UIButton) {
        setNotification()
    }
    @IBAction func resetNotificationButtonTapped(_ sender: UIButton) {
        updateNotification()
    }
    
    @IBAction func deletePendingNotificationsButtonTapped(_ sender: UIButton) {
        deletePendingNotifications()
    }
    @IBAction func deleteDeliveredNotificationsButtonTapped(_ sender: UIButton) {
        deleteDeliveredNotifications()
    }
    
    // MARK: - Methods
    
    // Create new
    private func setNotification() {
        
        // 1. Content
        
        let content = UNMutableNotificationContent()
        content.title = "First Notification"
        content.body = "You didn't update this one"
        content.sound = .default // Remember to add a sound, or it won't have one at all!
        
        // Counter of how many notifications this app has
        notificationsCounter += 1
        let counter = NSNumber(integerLiteral: notificationsCounter)
        content.badge = counter
        
        // 2. Trigger
        
        // Setting the Notification to show up after 15 seconds of pushing the button
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        
        // 3. Request ID
        
        let requestIdentifier = UUID().uuidString
        notificationsByIDs.append(requestIdentifier)
        id = requestIdentifier
        
        // MARK: - Notification Request :
        
        // 1. Create the Notification Request
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        // 2. Add the Notification Request to the Notification Center
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("There was an error creating the Notification: \(error)")
            }
        }
        print("Set the first notification")
    }
    
    // Update
    private func updateNotification() {
        // You need to create an entirely new Notification Request, using the ID of the Notification you want to update
        // Having the same ID makes the new NR replace the old one
        
        // 1. Content
        
        let content = UNMutableNotificationContent()
        content.title = "Updated Notification"
        content.body = "You updated the old one sucessfully!!"
        content.sound = .default // Remember to add a sound, or it won't have one at all!
        
        // Counter of how many notifications this app has
        notificationsCounter += 1
        let counter = NSNumber(integerLiteral: notificationsCounter)
        content.badge = counter
        
        // 2. Trigger
        
        // Setting the Notification to show up after 15 seconds of pushing the button
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        
        // 3. Getting the old ID saved in id
        
        let requestIdentifier = id
        
        // MARK: - Updating Notification Request :
        
        // 1. Create a new Notification Request, with the same id as the previous one
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        // ** This will replace the old one
        
        // 2. Add the updated Notification Request to the Notification Center
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("There was an error creating the second Notification: \(error)")
            }
        }
        print("Updated the first notification")
    }
    
    // Delete ALL pending Notifications from NotificationCenter
    private func deletePendingNotifications() {
        
        // Getting currently pending Notifications
        notificationCenter.getPendingNotificationRequests { (pendingNotifications) in
            print("\nFrom pendingNotifications closure:\n")
            print(pendingNotifications)
        }
        
        // Deleting Pending Notifications
        notificationCenter.removePendingNotificationRequests(withIdentifiers: notificationsByIDs)
        
        // Confirming that Pending Notifications where deleted
        notificationCenter.getPendingNotificationRequests { (pendingNotifications) in
            print("\nFrom pendingNotifications closure:\n")
            print(pendingNotifications)
        }
    }
    
    // Delete already delivered Notifications from NotificationCenter
    private func deleteDeliveredNotifications() {
        
        // Get already delivered Notifications
        notificationCenter.getDeliveredNotifications { (deliveredNotifications) in
            print("\nFrom deliveredNotifications closure:\n")
            print(deliveredNotifications)
            
        }
        
        // Deleting
        notificationCenter.removeAllDeliveredNotifications()
        
        // Confirming all Delivered Notifications where deleted
        notificationCenter.getDeliveredNotifications { (deliveredNotifications) in
            print("\nFrom deliveredNotifications closure:\n")
            print(deliveredNotifications)
            
        }
    }
}
