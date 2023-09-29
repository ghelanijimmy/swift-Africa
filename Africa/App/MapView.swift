//
//  MapView.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-27.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    
    
    @State private var position: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        var mapPosition: MapCameraPosition = .region(mapRegion)
        
        return mapPosition
    }()
    
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    //MARK: - BODY
    var body: some View {
        //MARK : - No1 BASIC MAP
        // Map(position: $position)
        
        //MARK : - No2 ADVANCED MAP
        Map(position: $position) {
            ForEach(locations) { location in
                
                Annotation(location.name, coordinate: location.location) {
                    MapAnnotationView(location: location)
                }
            }
        } //: MAP
        .onMapCameraChange({ updateContext in
            latitude = updateContext.camera.centerCoordinate.latitude
            longitude = updateContext.camera.centerCoordinate.longitude
        })
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image(.compass)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    ExtractedView(coordinate: latitude, type: "Latitude")
                    Divider()
                    ExtractedView(coordinate: longitude, type: "Longitude")
                } //: VSTACK
            } //: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .opacity(0.6)
                )
                .padding(),
            alignment: .top
        )
    }
}

//MARK: - PREVIEW
#Preview {
    MapView()
}

struct ExtractedView: View {
    let coordinate: Double
    let type: String
    var body: some View {
        HStack {
            Text("Latitude: ")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.accent)
            
            Spacer()
            
            Text("\(coordinate)")
                .font(.footnote)
                .foregroundStyle(.white)
        }
    }
}
