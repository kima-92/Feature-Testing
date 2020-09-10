//
//  ThirdViewController.swift
//  Local Notification Testing
//
//  Created by macbook on 9/7/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit
import UserNotifications

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func printCenterButtonTapped(_ sender: UIButton) {
        
        UNUserNotificationCenter.current().getDeliveredNotifications { (deliveredNotifications) in
            
            print(deliveredNotifications)
        }
    }
}
