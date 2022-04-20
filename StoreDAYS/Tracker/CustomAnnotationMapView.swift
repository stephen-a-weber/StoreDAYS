      //
      //  CustomAnnotationMapView.swift
      //  Map
      //
      //  Created by Young Ju on 4/2/22.
      //

      import SwiftUI
      import MapKit
import CoreLocation


      struct Spot: Identifiable {
            let id = UUID()
            let name: String
            let location: CLLocationCoordinate2D
            init(name: String, lat: Double, lon: Double) {
              self.name = name
              self.location = CLLocationCoordinate2D( latitude: lat, longitude: lon)
          }
      }
      let spots = [
            Spot(name: "Apple", lat: 37.32946269033143, lon: -122.03102014435285),
            Spot(name: "Oracle", lat: 37.79477559693708,lon: -122.40160337317623),
            Spot(name: "Google", lat: 37.42344260447229, lon: -122.0838103742167)
      ]
struct SpotAnnotationView: View {
      @State private var showTitle = true

      let title: String

      var body: some View {
        VStack(spacing: 0) {
          Text(title)
            .font(.callout)
            .padding(5)
            .background(Color(.white))
            .cornerRadius(10)
            .opacity(showTitle ? 0 : 1)

          Image(systemName: "mappin.circle.fill")
            .font(.title)
            .foregroundColor(.red)

          Image(systemName: "arrowtriangle.down.fill")
            .font(.caption)
            .foregroundColor(.red)
            .offset(x: 0, y: -5)
        }
        .onTapGesture {
          withAnimation(.easeInOut) {
            showTitle.toggle()
          }
        }
      }
}

struct CustomAnnotationMapView: View {
      @StateObject private var viewModel = CustomAnnotationMapModel()
      @State var region: MKCoordinateRegion
      

            var body: some View {
                  Map(coordinateRegion: $region,
                      interactionModes: [.all],
                      showsUserLocation: true,
                      userTrackingMode: .constant(.none),
                      annotationItems: spots
//                      , annotationContent: xx
                  ) { spot in
                MapAnnotation(coordinate: spot.location) {
                      SpotAnnotationView(title: spot.name)
//                                .onTapGesture {
//                                      withAnimation(.easeInOut) {
//                                             showTitle.toggle()
                                }
//                        }
                  }.edgesIgnoringSafeArea(.all)
                        .onAppear {
                              viewModel.checkIfLocationServicesIsEnabled()
            }
            }
final class CustomAnnotationMapModel: NSObject, ObservableObject, CLLocationManagerDelegate {
      
      var locationManager: CLLocationManager?
      
      func checkIfLocationServicesIsEnabled() {
            if CLLocationManager.locationServicesEnabled() {
                  locationManager = CLLocationManager()
                  locationManager!.delegate = self
                  locationManager!.desiredAccuracy = kCLLocationAccuracyBest
            } else {
                  print("Show an alert.")
            }
      }
      private func checkLocationAuthorization() {
            guard let locationManager = locationManager else {
                  return
            }
            switch locationManager.authorizationStatus {
                  case.notDetermined:
                        self.locationManager?.requestWhenInUseAuthorization()
                  case .restricted:
                        print("Your location is restricted for some reason.")
                  case .denied:
                        print("You have denied this app location permission.")
                  case .authorizedAlways, .authorizedWhenInUse:
                        break
                  @unknown default:
                        break
            }
      }
      func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            checkLocationAuthorization()
      }
      }
}
      struct CustomAnnotationMapView_Previews: PreviewProvider {
          static var previews: some View {
                Group {
                      CustomAnnotationMapView(region: MKCoordinateRegion(center: .init(latitude: 40.758185976198675, longitude: -73.98553187336162),
                                                                      latitudinalMeters: 30000, longitudinalMeters: 30000))
                }
          }
      }

