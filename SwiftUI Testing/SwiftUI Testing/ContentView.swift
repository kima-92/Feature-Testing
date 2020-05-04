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
        
        
        // Create a new Vertical Stack
        // It can be created and used with or without parameters
        VStack(alignment: .leading) {
            
            // To create a Text View (like labels)
            Text("Turtle Rock")
                .font(.title)
            
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                
                Spacer()
                
                Text("California")
                    .font(.subheadline)
            }
        }.padding()
            
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
