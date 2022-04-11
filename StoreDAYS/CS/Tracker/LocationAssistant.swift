//
//  LocationAssistant.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/1/22.
//

    import CoreLocation
    import CoreLocationUI
    import MapKit
    import SwiftUI

    class LocationAssistant: NSObject, ObservableObject, CLLocationManagerDelegate {
        let manager = CLLocationManager()
        private static let locationDistance: CLLocationDistance = 10000
        
        @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.766992, longitude: 73.972099), latitudinalMeters: LocationAssistant.locationDistance, longitudinalMeters: LocationAssistant.locationDistance) //Central Park Zoo, Wien Walk, New York, NY 10153, United States of America
        
        override init() {
            super.init()
            manager.activityType = .automotiveNavigation
            manager.delegate = self
        }
        
        func requestLocation() {
            manager.requestLocation()
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else { return }
            
            DispatchQueue.main.async {
                self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: Self.locationDistance, longitudinalMeters: Self.locationDistance)
            }
            
            print("\(location)")
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error.localizedDescription)
        }
    }

//class LocationManager: NSObject, ObservableObject {
//
//    private let locationManager = CLLocationManager()
//    @Published var location: CLLocation?
//    @Published var authorizationStatus: CLAuthorizationStatus = .authorizedAlways
//
//    override init() {
//        super.init()
//
////        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.distanceFilter = kCLDistanceFilterNone
////        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
//        locationManager.delegate = self
//    }
//
//    public func requestAuthorization(always: Bool = false) {
//        if always {
//            self.locationManager.requestAlwaysAuthorization()
//        } else {
//            self.locationManager.requestWhenInUseAuthorization()
//        }
//    }
//}
//
//extension LocationManager: CLLocationManagerDelegate {
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus, didUpdateLocations locations: [CLLocation]) {
////        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        self.authorizationStatus = status
//        guard let location = locations.last else { return }
//
//        DispatchQueue.main.async {
//            self.location = location
//        }
//
//    }
//
//}

