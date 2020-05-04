//
//  CircleImage.swift
//  SwiftUI Testing
//
//  Created by macbook on 5/3/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        
        // This creates an imageView Object
        // Inside the parentesis, you can put the name if the image file you want to use
        Image("tree")
            .resizable()  // lets you resize the image
            .frame(width: 400.0, height: 250.0)
            .scaledToFit()
            .clipShape(Circle())  // Cropping the image to be a circle
            .overlay(Circle().stroke(Color.white, lineWidth: 2))  // Set the stroke circle
            .shadow(radius: 10) // Adding a shadow under the circle
        
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
