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
    
    var pawsImageView: UIImageView = {
        let pawsImage = UIImage(named: "paws")
        let imageView = UIImageView(image: pawsImage)
        
        // Image should fit entirely in it's frame, regardless of it's frame size
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Join us today in our fun and games!"
        
        // Setup as bold, with a center alignment
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        
        // Block the user from interacting with the text view
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        // Turn off AutoResizingContraints for this View
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    // MARK: - DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Methods
    
    private func updateViews() {
        
        addViews()
        
        setupImagePawsView()
        setupDescriptionTextView()
        addTopContainer()
    }
    
    private func addViews() {
        
        // Add Views to the VC
        view.addSubview(pawsImageView)
        view.addSubview(descriptionTextView)
    }
    
    private func addTopContainer() {
        
        // Create a new View
        let topImageContainerView = UIView()
        
        // Give it a background color to visualize it
        topImageContainerView.backgroundColor = .blue
        
        // Add it to this VC's View
        view.addSubview(topImageContainerView)
        
        // Place it on screen using the x, y coordinates
        // Give it a size (height, width)
        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    private func setupImagePawsView() {
        
        // Modify this ImageView's Frame :
        //
        // Give it a specific height and width
        // And specify where on screen to display it,
        // using x and y coordinates :
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
    
    private func setupDescriptionTextView() {
        
        // Constraint the descriptionView's Top anchor, to the pawsView's bottom anchor
        // Separated by 150 points
        descriptionTextView.topAnchor.constraint(equalTo: pawsImageView.bottomAnchor, constant: 120).isActive = true
        
        // Constrait it's left and right anchors to the VC's left and right,
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // Constraint it's bottom to the view's bottom anchor
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

