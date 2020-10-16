//
//  ZStackTesting.swift
//  SwiftUI with Chris
//
//  Created by macbook on 10/16/20.
//

import SwiftUI

struct ZStackTesting: View {
    var body: some View {
        
        VStack {
            
            Spacer()
            ZStack {
                
                Image("lemon")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Image("doughnut")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Hello there!")
            }
            
            Spacer()
            Text("One View on top of the other")
            Spacer()
        }
    }
}

/*
 - Spacers will always have the same amount of width or/ height
 - They're porpuse is to center everything within the ContentVIew
 */

struct ZStackTesting_Previews: PreviewProvider {
    static var previews: some View {
        ZStackTesting()
    }
}
