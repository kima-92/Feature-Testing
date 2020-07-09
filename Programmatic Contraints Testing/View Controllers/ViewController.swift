//
//  ViewController.swift
//  Programmatic Contraints Testing
//
//  Created by macbook on 7/9/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addImagePawsView()
    }
    
    // MARK: - Methods
    
    private func addImagePawsView() {
        
        // Add an ImageView to the VC
        let pawsImage = UIImage(named: "paws")
        let imageView = UIImageView(image: pawsImage)
        
        view.addSubview(imageView)
        
        // Modify this ImageView's Frame :
        
        // Give it a specific height and width
        // And specify where on screen to display it,
        // using x and y coordinates
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
}

