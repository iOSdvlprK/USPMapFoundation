//
//  LocationManager.swift
//  USPMapFoundation
//
//  Created by joe on 11/27/25.
//

import Foundation
import MapKit

@MainActor class LocationManager {
    static let shared = LocationManager()
    let manager: CLLocationManager
    
    init() {
        self.manager = CLLocationManager()
        
        if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
        }
    }
}
