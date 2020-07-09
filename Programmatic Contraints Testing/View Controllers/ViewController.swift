//
//  ViewController.swift
//  Programmatic Contraints Testing
//
//  Created by macbook on 7/9/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var pawsImageView: UIImageView {
        let pawsImage = UIImage(named: "paws")
        let imageView = UIImageView(image: pawsImage)
        
        return imageView
    }
    
    // MARK: - DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addImagePawsView()
    }
    
    // MARK: - Methods
    
    private func addImagePawsView() {
        
        // Add an ImageView to the VC
        view.addSubview(pawsImageView)
        
        // Modify this ImageView's Frame :
        
        // Give it a specific height and width
        // And specify where on screen to display it,
        // using x and y coordinates
        //pawsImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        // Turn off AutoResizingContraints for this View
        pawsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Center it Horizontally
        // Using the VC'c view
        pawsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Center it Vertically
        // Using the VC'c view
        //pawsImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Setup it's Top Constraint
        // To this VC's top Constraint, by 100 points
        pawsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        // Adjust it's Width
        pawsImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        // Adjust it's Height
        pawsImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // ** If you don't end it with ".isActive = true", it will
        // create the constraint but not activate it (will NOT show on run time)
    }
}

