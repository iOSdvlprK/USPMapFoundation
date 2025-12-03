//
//  LocationManager.swift
//  USPMapFoundation
//
//  Created by joe on 11/27/25.
//

import Foundation
import MapKit

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    let manager = CLLocationManager()
    var region = MKCoordinateRegion()
    
    override init() {
        super.init()
        self.manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
        case .denied:
            print("denied")
        case .restricted:
            print("restricted")
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}
