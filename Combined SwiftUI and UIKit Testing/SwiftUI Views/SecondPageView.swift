//
//  SecondPageView.swift
//  Combined SwiftUI and UIKit Testing
//
//  Created by macbook on 5/4/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import SwiftUI

// Make sure this file executes ONLY if
// iOS 13 or later is available
@available(iOS 13.0, *)

struct SecondPageView: View {
    
    // Note object I want to recieve
    let note : Note
    
    // Initializer of a SwiftUI View
    init(note: Note) {
        self.note = note
    }
    
    // Function that presents the UI elements
    var body: some View {
        
        VStack {
            
            Image(uiImage: note.image)
                .resizable()
                .scaledToFit()
            
            //Text(note.title)
            Text(note.title)
                .font(.title)
                .bold()
                .padding(.top, 20)
                .padding(.bottom, 20)
            
        }
        .padding(.bottom, 200)
    }
}

/*
 
// Funtion that deals with the code presented
// (or not) in the canvas to your right
struct SecondPageView_Previews: PreviewProvider {
    static var previews: some View {
        SecondPageView()
    }
}

*/
