//
//  ResultView.swift
//  NavigationView in SwiftUI
//
//  Created by macbook on 10/18/20.
//

import SwiftUI

struct ResultView: View {
    
    // MARK: - Properties
    var choice: String
    
    var body: some View {
        Text("You chose \(choice)")
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView()
//    }
//}
