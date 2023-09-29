//
//  LocationModel.swift
//  Africa
//
//  Created by Jimmy Ghelani on 2023-09-28.
//

import Foundation
import MapKit

struct Location: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // COMPUTED PROPERTY
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
