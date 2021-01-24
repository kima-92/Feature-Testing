//
//  ContentView.swift
//  NavigationView in SwiftUI
//
//  Created by macbook on 10/18/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // Navigation View | Navigation Controller
        NavigationView {
            
            VStack(spacing: 30) {
                Text("You're going to flip a coin - do you want to choose heads or tails?")
                    .multilineTextAlignment(.center)
                
                // MARK: - Pushing a new ContentView
                
                // Choosing Head
                NavigationLink(
                    destination: ResultView(choice: "Heads"),
                    label: {
                        Text("Choose Heads")
                    })
                
                // Choosing Tails
                NavigationLink(
                    destination: ResultView(choice: "Tails"),
                    label: {
                        Text("Choose Tails")
                    })
                
                /*
                 NavigationLink:
                 
                 - destination -> the next View (ContentView) that will presented (pushed) from this current ContentView
                 - label -> It can be the Label or Image you want the button to look like, that triggers the action of pushing the new ContentView
                 */
            }
            .navigationBarTitle("Navigation title", displayMode: .inline)
        }
    }
}

/*
 - The .navigationBarTitle("Navigation title", displayMode: .inline) should be attached to one of the Views INSIDE the NavigationView, NOT the NavigationView itself.
 - Attaching it to the NavigationView itself, tells Swift that you one this one Title (with this displayMode) to be visible for ALL the ContentViews that you go to from here on. Which is not what we want.
 - Each ContentView should have it's own .navigationBarTitle credentials somewhere
 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
