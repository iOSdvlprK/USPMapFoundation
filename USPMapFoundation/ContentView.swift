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

struct ContentView: View {
    var body: some View {
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
    }
}

#Preview {
    ContentView()
}
