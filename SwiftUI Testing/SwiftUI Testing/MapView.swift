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
    
    // Put the code that updates the UIKit View
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        // Save the coordinates
        let coordinate = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
        
        // Set how far you want it to expand from the coordinate
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        
        // Set the region with that span and those coordinates
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        // Set the MapView to display (focus on) that region
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
