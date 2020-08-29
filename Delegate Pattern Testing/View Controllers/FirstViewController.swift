//
//  FirstViewController.swift
//  Delegate Pattern Testing
//
//  Created by macbook on 8/29/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

// MARK: - INTERN

// Doesn't know what to do.. Waiting for orders
// Will act accordingly based on what the Boss tells it to do

class FirstViewController: UIViewController {
    
    // MARK: - Oulet
    
    @IBOutlet weak var chooseColorButton: UIButton!
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action
    
    @IBAction func chooseColorButtonTapped(_ sender: UIButton) {
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
