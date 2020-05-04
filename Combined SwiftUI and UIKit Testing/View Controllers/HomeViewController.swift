//
//  HomeViewController.swift
//  Combined SwiftUI and UIKit Testing
//
//  Created by macbook on 5/4/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    var note = Note(title: "First Note", image: UIImage(named: "tree")!)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
    }
    
    // MARK: - Actions
    
    // Next Page
    @IBAction func nextPageButtonTapped(_ sender: UIButton) {
        
        if #available(iOS 13.0, *) {
            let secondPageV = SecondPageView(note: note)
            
            let host = UIHostingController(rootView: secondPageV)
            navigationController?.pushViewController(host, animated: true)
        } else {
            
            performSegue(withIdentifier: "ShowSecondFromSBSegue", sender: note)
        }
    }
    
    // Other Option
    @IBAction func otherOptionButtonTapped(_ sender: UIButton) {
        
        if #available(iOS 13.0, *) {
            let otherOptionV = OtherOptionView(note: note)
            
            let host = UIHostingController(rootView: otherOptionV)
            navigationController?.pushViewController(host, animated: true)
        } else {
            
            performSegue(withIdentifier: "ShowOtherOptionSegue", sender: note)
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowSecondFromSBSegue" {
            
            guard let secondPageFromSBVC = segue.destination as? SecondFromSBViewController else { return }
            
            secondPageFromSBVC.note = self.note
        }
        
        else if segue.identifier == "ShowOtherOptionSegue" {
            
            guard let otherOptionVC = segue.destination as? OtherOptionViewController else { return }
            
            otherOptionVC.note = self.note
        }
    }
}
