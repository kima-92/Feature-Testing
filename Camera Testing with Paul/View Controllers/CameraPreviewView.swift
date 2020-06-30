//
//  CameraPreviewView.swift
//  Camera Testing with Paul
//
//  Created by macbook on 6/30/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import UIKit
import AVFoundation

class CameraPreviewView: UIView {
    
    // This will override the normal layer presented for a View
    // To now display whatever the camera is currently viewing
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPlayerView: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    var session: AVCaptureSession? {
        get { return videoPlayerView.session }
        set { videoPlayerView.session = newValue }
    }

}
