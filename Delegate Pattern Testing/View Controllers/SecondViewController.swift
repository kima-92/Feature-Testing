//
//  SecondViewController.swift
//  Delegate Pattern Testing
//
//  Created by macbook on 8/29/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

// MARK: - BOSS
// Know all the information, and knows how to do things

protocol ColorSelectionDelegate {
    func didSelectColor(color: UIColor)
}

class SecondViewController: UIViewController {
    
    // MARK: - Properties
    
    // Our INTERN
    var selectionDelegate: ColorSelectionDelegate?
    
    // MARK: - Outlets

    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var violetButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func redButtonTapped(_ sender: UIButton) {
        selectionDelegate?.didSelectColor(color: .red)
        dismiss(animated: true)
    }
    
    @IBAction func blueButtonTapped(_ sender: UIButton) {
        selectionDelegate?.didSelectColor(color: .blue)
        dismiss(animated: true)
    }
    
    @IBAction func greenButtonTapped(_ sender: UIButton) {
        selectionDelegate?.didSelectColor(color: .green)
        dismiss(animated: true)
    }
    
    @IBAction func violetButtonTapped(_ sender: UIButton) {
        selectionDelegate?.didSelectColor(color: .purple)
        dismiss(animated: true)
    }
    
    @IBAction func yellowButtonTapped(_ sender: UIButton) {
        selectionDelegate?.didSelectColor(color: .yellow)
        dismiss(animated: true)
    }
}
