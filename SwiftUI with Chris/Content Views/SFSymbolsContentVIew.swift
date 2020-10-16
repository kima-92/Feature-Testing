//
//  SFSymbolsContentVIew.swift
//  SwiftUI with Chris
//
//  Created by macbook on 10/16/20.
//

import SwiftUI

struct SFSymbolsContentVIew: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "sunrise")
            Spacer()
            Image(systemName: "sunrise.fill")
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

/*
 These SF Symbols:
 - You can change the size, boldnes and color
 - They act as font, meaning the same modifiers that you can use for the San Franscisco font, will work good with this symbols
 */

struct SFSymbolsContentVIew_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolsContentVIew()
    }
}
