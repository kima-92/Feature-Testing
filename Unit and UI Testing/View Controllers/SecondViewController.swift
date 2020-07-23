//
//  SecondViewController.swift
//  Unit and UI Testing
//
//  Created by macbook on 7/23/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numbersTextField: UITextField!
    @IBOutlet weak var string1TextField: UITextField!
    @IBOutlet weak var string2TextField: UITextField!
    
    // MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func addBarButtonTapped(_ sender: UIBarButtonItem) {
        
        if view.backgroundColor == .black {
            view.backgroundColor = .white
            
        } else {
            view.backgroundColor = .black
        }
    }
    
    @IBAction func redButtonTapped(_ sender: UIButton) {
        view.backgroundColor = .red
    }
    @IBAction func blueButtonTapped(_ sender: UIButton) {
        view.backgroundColor = .blue
    }
    @IBAction func yellowButtonTapped(_ sender: UIButton) {
        view.backgroundColor = .yellow
    }
}
