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
    @State private var numbers = Array(repeating: 0, count: 9)
    
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    
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
                VStack {
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                        CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                        CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                        
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                        CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                        
                        Spacer()
                    }
                }
                
                // MARK: - Buttons
                
                HStack(spacing: 20) {
                    
                    // One Spin
                    VStack {
                        
                        Button(action: {
                            // Process a single Spin
                            processResults()
                            
                        }, label: {
                            Text("Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(Color.pink)
                                .cornerRadius(20)
                        })
                        Text("\(betAmount) credits")
                            .padding(.top, 10)
                            .font(.footnote)
                    }
                    
                    // Max Spin
                    VStack {
                        
                        // MARK: - Button
                        Button(action: {
                            // Process a single Spin
                            processResults(true)
                            
                        }, label: {
                            Text("Max Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(Color.pink)
                                .cornerRadius(20)
                        })
                        Text("\(betAmount * 5) credits")
                            .padding(.top, 10)
                            .font(.footnote)
                    }
                }
                Spacer()
            }
        }
    }
    
    // MARK: - Methods
    
    func processResults(_ isMax:Bool = false) {
        
        // Update backgrounds to white
        //                    self.backgrounds[0] = Color.white
        //                    self.backgrounds[1] = Color.white
        //                    self.backgrounds[2] = Color.white
        
        // ^^^
        backgrounds = backgrounds.map({ _ in Color.white })
        
        if isMax {
            
            // Change the images / Spin all the Cards
            //                    self.numbers[0] = Int.random(in: 0...symbols.count - 1)
            //                    self.numbers[1] = Int.random(in: 0...symbols.count - 1)
            //                    self.numbers[2] = Int.random(in: 0...symbols.count - 1)
            
            // ^^^
            numbers = numbers.map({_ in Int.random(in: 0...symbols.count - 1)})
        } else {
            // Spin the middle row
            numbers[3] = Int.random(in: 0...self.symbols.count - 1)
            numbers[4] = Int.random(in: 0...self.symbols.count - 1)
            numbers[5] = Int.random(in: 0...self.symbols.count - 1)
        }
        
        // Check winnings
        processWin(isMax)
    }
    
    func processWin(_ isMax:Bool = false) {
        
        var matches = 0
        
        if !isMax {
            // Processing for a single Spin
            
            if isMatch(3, 4, index3: 5) { matches += 1 }
            
        } else {
            // Processing for Max Spin
            
            // Top row
            if isMatch(0, 1, index3: 2) { matches += 1 }
            
            // Middle row
            if isMatch(3, 4, index3: 5) { matches += 1 }
            
            // Bottom row
            if isMatch(6, 7, index3: 8) { matches += 1 }
            
            // Diagonal top left to bottom right
            if isMatch(0, 4, index3: 8) { matches += 1 }
            
            
            // Diagonal top right to bottom left
            if isMatch(2, 4, index3: 6) { matches += 1 }
        }
        
        // Check matches and distribute credits
        
        if matches > 0 {
            // At least 1 win
            self.credits += matches * betAmount * 2
            
        } else if !isMax {
            // ) wins, single spin
            self.credits -= betAmount
        } else {
            // 0 wins, max spin
            self.credits -= betAmount * 5
        }
    }
    
    func isMatch(_ index1: Int, _ index2: Int, index3: Int) -> Bool {
        
        // Top row
        if self.numbers[index1] == numbers[index2] && numbers[index2] == numbers[index3] {
            
            // Update backgrounds to green
            self.backgrounds[index1] = Color.green
            self.backgrounds[index2] = Color.green
            self.backgrounds[index3] = Color.green
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
