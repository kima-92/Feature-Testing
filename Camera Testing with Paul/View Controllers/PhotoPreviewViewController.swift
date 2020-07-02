//
//  PhotoPreviewViewController.swift
//  Camera Testing with Paul
//
//  Created by macbook on 7/1/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class PhotoPreviewViewController: UIViewController {
    
    // MARK: - Properties
    var image: UIImage?
    
    // MARK: - Outlets
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    
    // MARK: - DidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        savePhoto()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Methods
    
    private func savePhoto() {
        guard let image = image else { return }
        
        // Save image to photo album
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        dismiss(animated: true, completion: nil)
    }
    
    private func updateViews() {
        photoImageView.image = image
    }
}
