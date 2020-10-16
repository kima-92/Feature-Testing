//
//  FoodPageContentView.swift
//  SwiftUI with Chris
//
//  Created by macbook on 10/16/20.
//

import SwiftUI

struct FoodPageContentView: View {
    var body: some View {
        
        ZStack {
            
            Image("food").resizable()
                .ignoresSafeArea()
                .aspectRatio( contentMode: .fill)
            
            VStack {
                HStack {
                    Spacer(minLength: 220)
                    Text("Hardcore Spaguetti\n and Meatballs")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image("apple").resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer(minLength: 200)
                }
                Spacer()
                Text("Energize with this healthy and hearty breakfast")
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
        }
    }
}

struct FoodPageContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodPageContentView()
    }
}
