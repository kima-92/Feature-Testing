//
//  MainPageView.swift
//  Camera Testing
//
//  Created by macbook on 5/8/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("Hello World")
            }
        .navigationBarTitle("Camera Demo")
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
