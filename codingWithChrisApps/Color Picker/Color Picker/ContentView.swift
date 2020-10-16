//
//  ContentView.swift
//  Color Picker
//
//  Created by macbook on 10/16/20.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var red:Double = 0
    @State private var green:Double = 0
    @State private var blue:Double = 0
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(red: red/255, green: green, blue: blue/255))
                .border(Color.black, width: 1)
            
            Slider(value: $red, in: 0...255, step: 1)
            Text("Red: \(Int(red))")
            
            Slider(value: $green, in: 0...255, step: 1)
            Text("Green: \(Int(green))")
            
            Slider(value: $blue, in: 0...255, step: 1)
            Text("Blue: \(Int(blue))")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
