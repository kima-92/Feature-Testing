//
//  MainPageView.swift
//  Camera Testing
//
//  Created by macbook on 5/8/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import SwiftUI

struct MainPageView: View {
    
    @State private var showSheet: Bool = false

    
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
                    
                }
                .padding()
                .actionSheet(isPresented: $showSheet) {
                    let alertTitle = Text("Select Photo")
                    let alertMessage = Text("Choose")
                    
                    return ActionSheet(title: alertTitle, message: alertMessage, buttons: [
                        .default(Text("Photo Library")) {
                            
                        },
                        .default(Text("Camera")) {
                            
                        },
                        .cancel()
                    ])
                }
            }
            .navigationBarTitle("Camera Demo")
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
