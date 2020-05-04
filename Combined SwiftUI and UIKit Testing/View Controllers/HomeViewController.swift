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
    
    var note = Note(title: "First Note", image: UIImage(named: "tree")!)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
    }
    

    @IBAction func nextPageButtonTapped(_ sender: UIButton) {
        
        if #available(iOS 13.0, *) {
            let secondPageV = SecondPageView(note: note)
            
            let host = UIHostingController(rootView: secondPageV)
            navigationController?.pushViewController(host, animated: true)
        } else {
            
            performSegue(withIdentifier: "ShowSecondFromSBSegue", sender: note)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowSecondFromSBSegue" {
            
            guard let secondPageFromSBVC = segue.destination as? SecondFromSBViewController else { return }
            
            secondPageFromSBVC.note = self.note
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
