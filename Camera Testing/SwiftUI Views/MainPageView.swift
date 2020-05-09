//
//  MainPageView.swift
//  Camera Testing
//
//  Created by macbook on 5/8/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import SwiftUI

struct MainPageView: View {
    
    // MARK: - Properties
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                // Placeholder Image
                Image("placeholderImage")
                    .resizable()
                    .frame(width: 300, height: 300)
                
                // Choose Picture button
                Button("Choose Picture") {
                    
                    self.showSheet = true
                    
                } // End of button
                .padding()
                // ActionSheet ( Alert )
                .actionSheet(isPresented: $showSheet) {
                    let alertTitle = Text("Select Photo")
                    let alertMessage = Text("Choose")
                    
                    return ActionSheet(title: alertTitle, message: alertMessage, buttons: [
                        .default(Text("Photo Library")) {
                            
                            self.showImagePicker = true
                            self.sourceType = .photoLibrary
                            
                        },
                        .default(Text("Camera")) {
                            
                            self.showImagePicker = true
                            self.sourceType = .camera
                            
                        },
                        .cancel()
                    ])
                }
            } // End of VStack
            .navigationBarTitle("Camera Demo")
            
        } // End of NavigationView
        .sheet(isPresented: $showImagePicker) {
            Text("MODAL")
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
