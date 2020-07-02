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
    
    // To display Video as it's being capture by the input device
    private var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var image: UIImage?
    
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
        takePicture()
    }
    
    // MARK: - Methods
    
    private func setupCaptureSession() {
        
        // Setup the resolution
        // To take a photo in Full Resulotion
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    private func setupDevice() {
        // Represent the device's camera
        
        // Getting all the devices (cameras) for this device (phone)
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .unspecified)
        
        let devices = deviceDiscoverySession.devices
        
        // Set which of these devices are in the front, and back
        for device in devices {
            
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
                
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        // Set up back camera as the default
        currentCamera = backCamera
    }
    
    private func setupInputOutput() {
        // Create capture device inputs
        // Which take capture devices and connect them to our capture session
        
        // It can throw an error
        do {
            // Try to create an input with the current device,
            // to capture data from that device, then add it to the capture session
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!) // TODO: - Don't force unwrap this!
            
            // provide that input to the session
            captureSession.addInput(captureDeviceInput)
            
            // Setup Photo Output
            photoOutput = AVCapturePhotoOutput()
            
            guard let photoOutput = photoOutput else { return }
            
            // Set the photoOutput to encode the data in jpeg format
            let photoSetting = [AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])]
            photoOutput.setPreparedPhotoSettingsArray(photoSetting, completionHandler: nil)
            
            // Add it to the Session
            captureSession.addOutput(photoOutput)
            
        } catch {
            NSLog("Couldn't add input/output to photo captureSession: \(error)")
        }
    }
    
    // * 1
    // * 2
    
    private func setupPreviewLayer() {
        // Create a Preview Layer and Start the Session
        
        // Create a videoPreviewLayer for this captureSession
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        guard let cameraPreviewLayer = cameraPreviewLayer else { return }
        
        // PreviewLayer Object provides a property named video gravity,
        // that indicates how the video preview is displayed
        
        // We want a full screen camera interface -> resizeAspectFill
        cameraPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        // Set it's layer to have the portrait orientation
        cameraPreviewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
        // Updtae the frame for this layer to give a full screen camera interface
        cameraPreviewLayer.frame = self.view.frame
        // Assign view's frame to it
        view.layer.insertSublayer(cameraPreviewLayer, at: .zero)
        
        // TODO: - Check what change needs to be made:
        // the CameraVC streams data from the camera more smoothly before actually recording anything
    }
    
    private func startRunningCaptureSession() {
        // Start running the captureSession, to start capturing data
        captureSession.startRunning()
    }
    
    private func takePicture() {
        
        guard let photoOutput = photoOutput else { return }
        
        // Capture a still image from the photoOutput,
        // Using the capturePhoto method
        let settings = AVCapturePhotoSettings()
        
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowPhotoPreviewSegue" {
            
            guard let photoPreviewVC = segue.destination as? PhotoPreviewViewController else { return }
            photoPreviewVC.image = image
        }
    }
}

// MARK: - Extensions

// This protocol contains methods we can use to get the image from output
extension PhotoCameraViewController: AVCapturePhotoCaptureDelegate {
    
    // To get information about the captured image, with the data captured from output
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        // This method gives you the still image in data, in the parameter "photo"
        // Convert it to UIImage
        if let imageData = photo.fileDataRepresentation() {
            image = UIImage(data: imageData)
            
            performSegue(withIdentifier: "ShowPhotoPreviewSegue", sender: self)
        }
    }
}
