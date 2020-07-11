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
    
    let topImageContainerView = UIView()
    
    var pawsImageView: UIImageView = {
        let pawsImage = UIImage(named: "paws")
        let imageView = UIImageView(image: pawsImage)
        
        // Image should fit entirely in it's frame, regardless of it's frame size
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var descriptionTextView: UITextView = {
        
        // Create the textView
        let textView = UITextView()
        
        //textView.text = "Join us today in our fun and games!"
        //textView.font = UIFont.boldSystemFont(ofSize: 18)
        
        // ^^ Better way of setting up a text with properties :
        
        // First String
        let descriptionText = "Join us today in our fun and games!"
        let descriptionAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
        let attributedText = NSMutableAttributedString(string: descriptionText, attributes: descriptionAttributes)
        
        // Append another
        let secondString = "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our store soon."
        let secondAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]
        let secondAttributedString = NSAttributedString(string: secondString, attributes: secondAttributes)
        
        attributedText.append(secondAttributedString)
        
        // Add it to the textView
        textView.attributedText = attributedText
        
        // Setup with a center alignment
        textView.textAlignment = .center
        
        // Block the user from interacting with the text view
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        // Turn off AutoResizingContraints for this View
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    private let previousButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Methods
    
    private func updateViews() {
        
        addViews()
        
        addTopContainer()
        setupImagePawsView()
        setupDescriptionTextView()
        
        setupBottomControls()
    }
    
    private func addViews() {
        
        // Add Views to the VC
        //view.addSubview(pawsImageView)
        view.addSubview(descriptionTextView)
    }
    
    fileprivate func setupBottomControls() {
        view.addSubview(previousButton)
        
        previousButton.backgroundColor = .red
        //previousButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        // MARK: - Different way of activating constraints
        // By creating an array of Activated Constraints
        NSLayoutConstraint.activate([
            previousButton.topAnchor.constraint(equalTo: view.topAnchor),
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previousButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previousButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addTopContainer() {
        
        // Create a new View
        //let topImageContainerView = UIView()
        
        // Give it a background color to visualize it
        //topImageContainerView.backgroundColor = .blue
        
        // Add it to this VC's View
        view.addSubview(topImageContainerView)
        
        // Place it on screen using the x, y coordinates
        // Give it a size (height, width)
        //topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        // Enable Auto Layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set the height as equal to the view's height,
        // But with a multiplyer of 0.5
        // The topContainer needs to be half of the height of the view
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        // Set the top, left and right anchor to match the view's
        // The topContainer needs to always be at the top half of the view
        //topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // ^^ Same thing as above, but using leading and trailing anchors
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
    }
    
    private func setupImagePawsView() {
        
        // Add it in screen inside the topContainer
        topImageContainerView.addSubview(pawsImageView)
        
        // Turn off AutoResizingContraints for this View
        pawsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Anchor pawsImae to the center of the topContainer
        pawsImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        pawsImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        
        // Set it's height,
        // to be half of the topContainer's height
        pawsImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func firstSetupImagePawsView() {
        
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
        //descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 120).isActive = true
        
        // Adjust it's top anchor to the topContainer's bottom anchor instead
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        
        // Constrait it's left and right anchors to the VC's left and right,
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        // * positive #'s pushes it further away from the screen (towards the right),
        // negatives will push it towards the left
        
        // Constraint it's bottom to the view's bottom anchor
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

