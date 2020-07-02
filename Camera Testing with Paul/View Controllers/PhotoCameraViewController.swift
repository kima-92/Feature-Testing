//
//  PhotoCameraViewController.swift
//  Camera Testing with Paul
//
//  Created by macbook on 7/1/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoCameraViewController: UIViewController {
    
    // MARK: - Properties
    
    private var captureSession = AVCaptureSession()
    
    private var backCamera: AVCaptureDevice?
    private var frontCamera: AVCaptureDevice?
    private var currentCamera: AVCaptureDevice?
    private var photoOutput: AVCapturePhotoOutput?
    
    // MARK: - Outlets
    
    @IBOutlet weak var takePictureButton: UIButton!
    
    // MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
    }
    
    // MARK: - Actions
    
    @IBAction func takePictureButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowPhotoPreviewSegue", sender: self)
    }
    
    // MARK: - Methods
    
    private func setupCaptureSession() {
        
        // Setup the resolution
        // To take a photo in Full Resulotion
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
    }
    
    private func setupDevice() {
        // Represent the device's camera
        
        // Getting all the devices (cameras and microphones) for this device (phone)
        let deviceDescoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .unspecified)
        
        let devices = deviceDescoverySession.devices
        
        // Set which of these devices are in the front, and back
        var count = 1
        for device in devices {
            
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
                
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
            
            print("\nCamera \(count): \(device)")
            count += 1
        }
        // Set up back camera as the default
        currentCamera = backCamera
    }
    
    private func setupInputOutput() {
        // Create capture device inputs
        // Which take capture devices and connect them to our capture session
        
        // It can throw an error
        do {
            // Try to create an imput with the current device,
            // to capture data from that device, then add it to the capture session
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!) // TODO: - Don't force unwrap this!
            
            // provide that imput to the session
            captureSession.addInput(captureDeviceInput)
            
            // Setup Photo Output
            // Telling it to use the jpeg format for it's video Codec
            // jpeg encoder?
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            
        } catch {
            print(error) // TODO: - Handle this better!
        }
    }
    
    private func setupPreviewLayer() {
        
    }
    
    private func startRunningCaptureSession() {
        
    }
}
