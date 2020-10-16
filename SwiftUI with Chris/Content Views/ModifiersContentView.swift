//
//  ModifiersContentView.swift
//  SwiftUI with Chris
//
//  Created by macbook on 10/16/20.
//

import SwiftUI

struct ModifiersContentView: View {
    /*
     Keep in mind that the order you put the modifiers DOES matter.
     If you where to put the cornerRadius AFTER putting the padding, you will basically get the cornerRadius on the padding of the Image, instead of rounding the image itself
     For the image to look rounded, put the cornerRadius first and THEN add the padding
     */
    var body: some View {
        Image("pinkBuilding")
            .resizable() // This tells SwiftUI it's ok to resize this image
            .cornerRadius(30)
            .padding() // Padding with no parameters gives the same padding around the entire image
            .shadow(radius: 10)
    }
}

struct ModifiersContentView_Previews: PreviewProvider {
    static var previews: some View {
        ModifiersContentView()
    }
}
