//
//  SliderView.swift
//  Color Picker
//
//  Created by macbook on 10/16/20.
//

import SwiftUI

struct SliderView: View {
    
    // MARK: - Properties
    
    @Binding var value: Double
    var label: String
    
    var body: some View {
        VStack {
            
            Slider(value: $value, in: 0...255, step: 1)
            Text("\(label): \(Int(value))")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: Binding.constant(50), label: "Label").padding()
    }
}

/*
 Because you didn't initialized the value and label property, the SliderView_Preview will give you an error. Till you give it parameters to initialize the SliderView with for preview porpuses
 
 PS: The padding added in the SliderView_Previews does not effect at all at run time. It will use the padding is added to the contentView that calls this View anyways
 */
