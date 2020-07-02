//
//  Comments.swift
//  Camera Testing with Paul
//
//  Created by macbook on 7/1/20.
//  Copyright © 2020 WilmaRodriguez. All rights reserved.
//

import Foundation

/*
 -  We take capture devices, and use them to create capture Inputs
 -  Provide the Session with these inputs
 -  Then save the results un capture Outputs
 
 Setting up the Capture Session:
 
 1. Create a Capture Session
 2. Configuring the nesesary capture devices
 3. Create inputs using the capture devices
 4. Configuring a photo output object to process captured images
 
 When we have the camera device ready, create a layer to display the result on the screen
 
 Capture Session will start running when we have finished the configuration
 
 
 1. We'll add photo output to the caprture session later, when we want to capture a still image
 
2.  We have now configured the AVCaptureSession Object, and are ready to present the camera\
 3. Time to show what it (the camera) captures, on screen
 
 
 -  AVCapturePhotoCaptureDelegate:
    Contains methods for monitoring progress and recieving results from a photo capture Output
 -  Since iOS 11, we use didFinishProcessingPhoto to get the resulting photo
 */
