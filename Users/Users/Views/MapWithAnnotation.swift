//
//  MapWithAnnotation.swift
//  Users
//
//  Created by Robert on 24.04.25.
//
import SwiftUI
import MapKit

struct MapWithAnnotation: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 59.9343, longitude: 30.3351), // Санкт-Петербург
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    let annotation = [
        Location(name: "Санкт-Петербург", coordinate: CLLocationCoordinate2D(latitude: 59.9343, longitude: 30.3351))
    ]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotation) { location in
            MapMarker(coordinate: location.coordinate, tint: .red)
        }
    }
}

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
