//
//  CameraViewController.swift
//  Camera Testing with Paul
//
//  Created by macbook on 6/30/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cameraView: CameraPreviewView!
    @IBOutlet weak var recordButton: UIButton!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Resize camera preview to fill the entire screen
        cameraView.videoPlayerView.videoGravity = .resizeAspectFill
    }
    
    // MARK: - Actions
    
    @IBAction func recordButtonTapped(_ sender: UIButton) {
    }
    
    // MARK: - Methods
    
    // Creates a new file URL in the documents directory
    private func newRecordingURL() -> URL {
        
        // Grab the documents folder from the device
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        // Create a name for the new file
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        
        let name = formatter.string(from: Date())
        
        // Appends a new URL file in Documents with the created name, and the ".mov" extension
        // Save that URL so you can return it
        let fileURL = documentsDirectory.appendingPathComponent(name).appendingPathExtension("mov")
        
        return fileURL
    }
}
