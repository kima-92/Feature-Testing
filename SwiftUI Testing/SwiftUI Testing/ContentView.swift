//
//  ContentView.swift
//  SwiftUI Testing
//
//  Created by macbook on 5/3/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        VStack {
            
            // MARK: - Map
            
            // Add an instance of the MapView struct we created
            MapView()
                .frame(height: 300)  // Set the height
                .edgesIgnoringSafeArea(.top)  // Set it to ignore the safe area (at the top)
            
            // MARK: - Image
            
            // Add an instance of the CircleImage we created
            CircleImage()
                .offset(y: -130)
            //   ^^ This pushes the image to be on top of the map.
            // Without it, the circle would be exacly under the map
                .padding(.bottom, -130)
            //  ^^ The bottom edges of the circle will be pulled up by -130
            // This will help bring the textViews up
            
            
            // MARK: - TextViews
            
            // Create a new VStack (Vertical Stack)
            // It can be created and used with or without parameters
            VStack(alignment: .leading) {
                
                // To create a Text View (like labels)
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    
                    Spacer() // Takes as much space as it can
                    
                    Text("California")
                        .font(.subheadline)
                }
            }.padding()
            
            // MARK: - Spacer
            Spacer()
            // ^^ It will take as much space as it can, till everything in this VStack touches the edges of the screen
            // by putting it here at the bottom, everything else goes up
        }
            
    }
}

// This tells the compiler what to show in the preview
// to your right, and what not to show.
// Also, this code is ignored when you push this app to
// TestFlight or the App Store
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
