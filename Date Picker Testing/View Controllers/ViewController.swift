//
//  ViewController.swift
//  Date Picker Testing
//
//  Created by macbook on 9/22/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func printDateButtonTapped(_ sender: UIButton) {
        let date = datePicker.date
        print(date)
    }
    
}

