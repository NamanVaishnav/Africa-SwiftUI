//
//  MapView.swift
//  Africa
//
//  Created by Naman Vaishnav on 31/07/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent:  {
            item in
            
//            MapPin(coordinate: item.location, tint: .accentColor)
//            MapMarker(coordinate: item.location, tint: .accentColor)
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .frame(width: 32, height: 32, alignment: .center)
            }//: ANNOTATION
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
