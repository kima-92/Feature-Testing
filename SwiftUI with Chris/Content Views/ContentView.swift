//
//  ContentView.swift
//  SwiftUI with Chris
//
//  Created by macbook on 10/16/20.
//

import SwiftUI

struct ContentView: View {
    
    // The body is expecting a SINGLE VIew,
    // it will give you an error if there's more than one root View
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top, spacing: 20, content: {
                
                Text("Hello")
                Image("lemon")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                Button(action: {}
                       
                       // TODO
                       ,
                       label: {
                        Image("doughnut")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                       })
            })
            Spacer()
        }
    }
}


// This code is for Preview porpuses -->
// it will NOT affect the code at run time
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
