//
//  ContentView.swift
//  USPMapFoundation
//
//  Created by joe on 11/22/25.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static var coffee: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 30.011180, longitude: -95.512560)
    }
    
    static var restaurant: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 29.988869677028426, longitude: -95.55595575564956)
    }
}

enum MapOptions: String, Identifiable, CaseIterable {
    case standard
    case hybrid
    case imagery
    
    var id: String { self.rawValue }
    
    var mapStyle: MapStyle {
        switch self {
        case .standard:
            return .standard
        case .hybrid:
            return .hybrid
        case .imagery:
            return .imagery
        }
    }
}

struct ContentView: View {
    @State private var selectedMapOption: MapOptions = .standard
    
    var body: some View {
        ZStack(alignment: .top) {
            Map {
                Annotation("Coffee", coordinate: .coffee) {
                    Image(systemName: "cup.and.saucer.fill")
                        .padding(4)
                        .foregroundStyle(.white)
                        .background(.indigo)
                        .clipShape(.rect(cornerRadius: 4.0))
                }
                Annotation("Restaurant", coordinate: .restaurant) {
                    Image(systemName: "fork.knife.circle")
                }
            }
            .mapStyle(selectedMapOption.mapStyle)
            
            Picker("Map Styles", selection: $selectedMapOption) {
                ForEach(MapOptions.allCases) { mapOption in
                    Text(mapOption.rawValue.capitalized).tag(mapOption)
                }
            }
            .pickerStyle(.segmented)
            .background(.white)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
