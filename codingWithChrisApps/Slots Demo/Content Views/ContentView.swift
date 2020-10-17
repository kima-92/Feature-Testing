//
//  ContentView.swift
//  Slots Demo
//
//  Created by macbook on 10/16/20.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 1, 2]
    @State private var credits = 1000
    private var betAmount = 5
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            // Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 288/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                // Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("Swift Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                // Credits counter
                Text("Creadits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                // Cards
                HStack {
                    Spacer()
                    
                    CardView(symbol: $symbols[numbers[0]])
                    CardView(symbol: $symbols[numbers[1]])
                    CardView(symbol: $symbols[numbers[2]])
                    
                    Spacer()
                }
                
                Spacer()
                
                // Button
                Button(action: {
                    
                    // Change the images
                    self.numbers[0] = Int.random(in: 0...symbols.count - 1)
                    self.numbers[1] = Int.random(in: 0...symbols.count - 1)
                    self.numbers[2] = Int.random(in: 0...symbols.count - 1)
                    
                    // Check winnings
                    if self.numbers[0] == numbers[1] && numbers[1] == numbers[2] {
                        
                        // Won
                        credits += betAmount * 10
                        
                    } else {
                        self.credits -= betAmount
                    }
                    
                }, label: {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                })
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
