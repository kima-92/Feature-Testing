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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Set this INTERN as the delegate in the BOSS VC
        if segue.identifier == "ShowColorSelectionScreenSegue" {
            guard let bossVC = segue.destination as? SecondViewController else { return }
            
            bossVC.selectionDelegate = self
        }
    }
}

// Conforming to ColorSelectionDelegate
extension FirstViewController: ColorSelectionDelegate {
    
    func didSelectColor(color: UIColor) {
        view.backgroundColor = color
    }
}
