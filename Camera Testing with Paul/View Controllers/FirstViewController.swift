//
//  FirstViewController.swift
//  Camera Testing with Paul
//
//  Created by macbook on 6/30/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    // This VC's only purpose is to get permission from the user
    // to use the camera, before actually streaming from the camera
    
    // MARK: - Properties
    var captureType: CaptureType = .picture
    
    // MARK: - Outlets
    
    @IBOutlet weak var takePictureButton: UIButton!
    @IBOutlet weak var takeVideoButton: UIButton!
    
    // MARK: - DidLoad and DidAppear

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Actions
    
    @IBAction func takePictureButtonTapped(_ sender: UIButton) {
        captureType = .picture
        showCameraIfGrantedPermission()
    }
    @IBAction func takeVideoButtonTapped(_ sender: UIButton) {
        captureType = .video
        showCameraIfGrantedPermission()
    }
    
    // MARK: - Methods
    
    private func showCameraIfGrantedPermission() {
        
        // Check the status of authorization for video
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        // Next step base on current status
        switch status {
            
        // 1st run and the user hasn't been asked to give permission
        case .notDetermined:
            requestPermission()
            
        // Parental Control limits access to video
        case .restricted:
            fatalError("Device has been restricted by parent or guardian")
            
        // 2nd+ run, the user didn't give permission on purpose or by accident, request again ( show how to enable
        case .denied:
            fatalError("Show them a link to settings so they can enable video")
            
        // 2nd+ run, user has given permission to use camera
        case .authorized:
            showCamera()
            
        @unknown default:
            fatalError("Didn't handle a new state for AVCaptureDevice authorization")
        }
    }
    
    // Request Permission for the first time
    private func requestPermission() {
        
        // Show Pop up requesting access to video from the camera for the first time (will never show this again for this app)
        AVCaptureDevice.requestAccess(for: .video) { granted in
            
            
            guard granted else {
                fatalError("Tell user they need to give video permission")
            }
            
            DispatchQueue.main.async {
                self.showCamera()
            }
        }
    }
    
    private func showCamera() {
        performSegue(withIdentifier: "ShowCamera", sender: self)
    }
    
    private func updateViews() {
        takePictureButton.layer.masksToBounds = true
        
        takeVideoButton.layer.cornerRadius = 15
        takePictureButton.layer.cornerRadius = 15
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowCamera" {
            
            guard let cameraVC = segue.destination as? CameraViewController else { return }
            cameraVC.captureType = self.captureType
        }
    }
}
