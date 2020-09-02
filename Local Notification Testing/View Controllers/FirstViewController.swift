//
//  FirstViewController.swift
//  Local Notification Testing
//
//  Created by macbook on 9/2/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }
    
    // MARK: - Methods
    
    private func createButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        button.setTitle("Get Notification", for: .normal)
        button.addTarget(self, action: #selector(getNotification), for: .touchUpInside)
        button.center = view.center
        view.addSubview(button)
    }
    
    @objc private func getNotification(sender: UIButton) {
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
