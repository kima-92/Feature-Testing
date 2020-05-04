//
//  MapView.swift
//  SwiftUI Testing
//
//  Created by macbook on 5/3/20.
//  Copyright © 2020 WilmaRodz. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    // Where you make an instance of the UIKitView
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        
        MKMapView()
    }
    
    // Put the code to update the UIKit VIew
    func updateUIView(_ uiView: MapView.UIViewType, context: UIViewRepresentableContext<MapView>) {
    
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
