//
//  CameraViewController.swift
//  Camera Testing with Paul
//
//  Created by macbook on 6/30/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy private var captureSession = AVCaptureSession()
    lazy private var fileOutput = AVCaptureMovieFileOutput()
    
    private var player: AVPlayer!
    
    // MARK: - Outlets
    
    @IBOutlet weak var cameraView: CameraPreviewView!
    @IBOutlet weak var recordButton: UIButton!
    
    // MARK: - DidLoad and DidAppear
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Resize camera preview to fill the entire screen
        cameraView.videoPlayerView.videoGravity = .resizeAspectFill
        
        setUpCaptureSession()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Start streaming when this VC Appears
        captureSession.startRunning()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Stop streaming when this VC desappears
        captureSession.stopRunning()
    }
    // MARK: - Actions
    
    @IBAction func recordButtonTapped(_ sender: UIButton) {
        
        if fileOutput.isRecording {
            fileOutput.stopRecording()
        } else {
            fileOutput.startRecording(to: newRecordingURL(), recordingDelegate: self)
        }
    }
    
    // MARK: - Methods
    
    private func setUpCaptureSession() {
        
        captureSession.beginConfiguration()
        
        // 1.   Add inputs
        let camera = bestCamera()
        
        // 2.   Video
        
        // If we can get the data from this camera, and add it as input to the camera session
        guard let captureInput = try? AVCaptureDeviceInput(device: camera),
            captureSession.canAddInput(captureInput) else {
                fatalError("Can't create the input from the camera")
        }
        
        // Add it to the session
        captureSession.addInput(captureInput)
        
        // Choose the resolution
        if captureSession.canSetSessionPreset(.hd1920x1080) {
            
            captureSession.sessionPreset = .hd1920x1080
        }
        // ** 4K is 4 times the size of HD (you can try it later and see how it goes..
        
        
        // 3.   Audio
        
        // 4.   Add Output
        
        // 5.   Recording to disk
        
        guard captureSession.canAddOutput(fileOutput) else {
            fatalError("Cannot record to disk")
        }
        
        captureSession.addOutput(fileOutput)
        
        captureSession.commitConfiguration()
        
        // 6.   Live Preview
        cameraView.session = captureSession // Starts streaming that video on  screen
    }
    
    // Get the best camera option for this device
    private func bestCamera() -> AVCaptureDevice {
        
        
        if let ultraWideCamera = AVCaptureDevice.default(.builtInUltraWideCamera, for: .video, position: .back) {
            
            print("Used Ultra Wide Camera")
            return ultraWideCamera
        }
        
        // All iPhones have a wide angle camera (front + back)
        // If the previous fails, we can try thos one
        if let wideCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
            
            print("Used Wide Camera")
            return wideCamera
        }
        fatalError("No cameras found on this device")
    }
    
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
    
    // Display Preview of recorded video
    private func playMovie(url: URL) {
        
        // We can't use this without a video URL, it would crash without it
        player = AVPlayer(url: url)
        
        // This creates a special kind of View that is good for playing an already recorded movie.
        // Not the same as the layer that streams data directly from the camera live
        let playerLayer = AVPlayerLayer(player: player)
        
        // Set the CGRect where you want to display the preview (playerLayer):
        
        // Top left corner (For Fullscreen, you'd need a close button)
        var topRect = view.bounds
        
        topRect.size.height = topRect.size.height / 4
        topRect.size.width = topRect.size.width / 4
        // ^^ Creates a constant for the magic number
        topRect.origin.y = view.layoutMargins.top
        // ^^ using the safe area of the screen
        
        // Set that CGRect as the frame of playerLAyer
        playerLayer.frame = topRect
        
        // Add this view to the screen
        view.layer.addSublayer(playerLayer)
        
        // Play the movie
        player.play()
    }
    
    private func updateViews() {
        
        // If is recording is True, the recordButton's state will be True
        recordButton.isSelected = fileOutput.isRecording
    }
}

// MARK: - Extensions

// Conforming to RecordingDelegate
extension CameraViewController: AVCaptureFileOutputRecordingDelegate {
    
    // Does functionality when it's Done Recording
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        
        print("didFinishRecording")
        
        if let error = error {
            print("Video Recording Error: \(error)")
            
        } else {
            playMovie(url: outputFileURL)
        }
        updateViews()
    }
    
    // Functionality for when it Starts Recording
    func fileOutput(_ output: AVCaptureFileOutput, didStartRecordingTo fileURL: URL, from connections: [AVCaptureConnection]) {
        print("didStartRecording: \(fileURL)")
        
        // Update UI
        updateViews()
    }
}
