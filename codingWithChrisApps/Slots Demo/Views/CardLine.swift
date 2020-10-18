//
//  CardLine.swift
//  Slots Demo
//
//  Created by macbook on 10/17/20.
//

import SwiftUI

struct CardLine: View {
    
    // MARK: - Properties
    
    @Binding var backgrounds:[Color]
    @Binding var symbols:[String]
    
    var body: some View {
        // Cards
        HStack {
            Spacer()
            
            CardView(symbol: $symbols[0], background: $backgrounds[0])
            CardView(symbol: $symbols[2], background: $backgrounds[1])
            CardView(symbol: $symbols[3], background: $backgrounds[2])
            
            Spacer()
        }
    }
}

struct CardLine_Previews: PreviewProvider {
    static var previews: some View {
        CardLine(backgrounds: Binding.constant([Color.white, Color.white, Color.white]), symbols: Binding.constant(["apple", "cherry", "apple"]))
    }
}
