//
//  PageCollectionViewCell.swift
//  Programmatic Contraints Testing
//
//  Created by macbook on 7/13/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            
            mainImageView.image = UIImage(named: page.imageName)
            
            // First Attributed String
            let descriptionText = page.headerText
            let descriptionAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)]
            let attributedText = NSMutableAttributedString(string: descriptionText, attributes: descriptionAttributes)
            
            // Append another
            let secondString = "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our store soon."
            let secondAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]
            let secondAttributedString = NSAttributedString(string: secondString, attributes: secondAttributes)
            
            attributedText.append(secondAttributedString)
            
            // Add it to the textView
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
            // TODO: - Text is not properly setting it's size and it's bold font
        }
    }
    
    let topImageContainerView = UIView()
    
    var mainImageView: UIImageView = {
        let pawsImage = UIImage(named: "paws")
        let imageView = UIImageView(image: pawsImage)
        
        // Image should fit entirely in it's frame, regardless of it's frame size
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var descriptionTextView: UITextView = {
        
        // Create the textView
        let textView = UITextView()

//        // Setup with a center alignment
        textView.textAlignment = .center
        
        // Block the user from interacting with the text view
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        // Turn off AutoResizingContraints for this View
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        updateViews()
    }
    
    // Required init Swift will have you code
    // when overriding an init in a CollectionViewcell
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func updateViews() {
        
        addTopContainer()
        setupImagePawsView()
        setupDescriptionTextView()
        
        //setupBottomControls()
    }
    
    private func addTopContainer() {
        // Add/display topImageContainer
        addSubview(topImageContainerView)
        
        // Enable Auto Layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set the height as equal to the view's height,
        // But with a multiplyer of 0.5
        // The topContainer needs to be half of the height of the view
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        // topContainer needs to always be at the top half of the view
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func setupImagePawsView() {
        
        // Add it in screen inside the topContainer
        topImageContainerView.addSubview(mainImageView)
        
        // Turn off AutoResizingContraints for this View
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Anchor pawsImae to the center of the topContainer
        mainImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        
        // Set it's height,
        // to be half of the topContainer's height
        mainImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupDescriptionTextView() {
        
        // Add it as a subView of this view
        addSubview(descriptionTextView)
        
        // Adjust it's top anchor to the topContainer's bottom anchor
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        
        // Constrait it's left and right anchors to the view's left and right,
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        // * positive #'s pushes it further away from the screen (towards the right),
        // negatives will push it towards the left
        
        // Constraint it's bottom to the view's bottom anchor
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
