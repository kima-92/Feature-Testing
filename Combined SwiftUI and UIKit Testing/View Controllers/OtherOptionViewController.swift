//
//  OtherOptionViewController.swift
//  Combined SwiftUI and UIKit Testing
//
//  Created by macbook on 5/4/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import UIKit

class OtherOptionViewController: UIViewController {
    
    // MARK: - Properties
    var note: Note?
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        
        guard let note = note else { return }
        
        titleLabel.text = note.title
        view.backgroundColor = .systemPink
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
