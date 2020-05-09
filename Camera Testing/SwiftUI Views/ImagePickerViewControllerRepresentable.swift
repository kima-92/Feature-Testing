//
//  ImagePickerViewControllerRepresentable.swift
//  Camera Testing
//
//  Created by macbook on 5/9/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import Foundation
import SwiftUI

struct ImagePickerViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    @Binding var image: UIImage?
    @Binding var isShown: Bool
    
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    // This is used if the Picker will change
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    func makeCoordinator() -> ImagePickerViewControllerRepresentable.Coordinator {
        return ImagePickerCoordinator(image: $image, isShown: $isShown)
    }
    
    // Make sure to return the appropriate dataType
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerViewControllerRepresentable>) -> UIImagePickerController {
        
        // Create a UIImagePickerController
        let picker = UIImagePickerController()
        // Set it's sourceType
        picker.sourceType = sourceType
        // Set it's delegate
        picker.delegate = context.coordinator
        // Retrun that UIImagePickerController
        return picker
        
    }
}
