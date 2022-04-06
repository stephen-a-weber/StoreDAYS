      //
      //  CustomAnnotationMapView.swift
      //  Map
      //
      //  Created by Young Ju on 4/2/22.
      //

      import SwiftUI
      import MapKit


      struct Spot: Identifiable {
            let id = UUID()
            let name: String
            let location: CLLocationCoordinate2D
            init(name: String, lat: Double, lon: Double) {
              self.name = ""
              self.location = CLLocationCoordinate2D( latitude: lat, longitude: lon)
          }
      }

      let spots = [
            Spot(name: "Time Square", lat: 40.758185976198675, lon: -73.98553187336162),
            Spot(name: "Wall Street", lat: 40.706097011807266, lon: -74.00883875134176),
            Spot(name: "Central Park", lat: 40.781745541214796, lon: -73.96659876341757)
      ]
      //var directions = new mapkit.Directions({
      //    language: "en-GB"
      //})
      struct CustomAnnotationMapView: View {
            
      @State var region: MKCoordinateRegion

            var body: some View {
      //            Map(coordinateRegion: $mapViewModel.region,
      //                                interactionModes: [.all],
      //                                showsUserLocation: true,
      //                                userTrackingMode: .constant(.none),
      //                                annotationItems: annotations) { place in
      //                                MapAnnotation(coordinate: place.placemark.location!.coordinate) {
      //                                    MapPinView()
      //                                }
      //                            }
      //                                .tint(.blue)
      //                                .environmentObject(mapViewModel)
      //                                .edgesIgnoringSafeArea(.all)
      //                                .onAppear {
      //                                    mapViewModel.checkLocationServicesIsEnabled()
      //
      //                                }
                  Map(coordinateRegion: $region,
                      interactionModes: [.all],
                      showsUserLocation: true,
                      userTrackingMode: .constant(.none),
                      annotationItems: spots
                  ) { spot in
            //                                MapAnnotation(coordinate: place.placemark.location!.coordinate) {
            //                                    MapPinView()
            //                                }
                MapAnnotation(coordinate: spot.location) {
                            Circle()
                                .stroke(.green, lineWidth: 3)
                                .frame(width: 33, height: 33)
                                .onTapGesture {
                                    print("Tapped on \(spot.name)")
                                }
                        }
      //                  MapAnnotation(coordinate: place.location) {
      //                      Rectangle().stroke(Color.blue)
      //                      .frame(width: 20, height: 20)
      //                  }
      //  ANNOTATION OPTION2      MapPin(coordinate: place.location,  tint: Color.cyan)
      //  ANNOTATION OPTION3      MapMarker(coordinate: place.location, tint: Color.purple)
                  }.edgesIgnoringSafeArea(.all)

            }
      }

      struct CustomAnnotationMapView_Previews: PreviewProvider {
          static var previews: some View {
                Group {
                      CustomAnnotationMapView(region: MKCoordinateRegion(center: .init(latitude: 40.758185976198675, longitude: -73.98553187336162),
                                                                      latitudinalMeters: 500, longitudinalMeters: 500))
                }
          }
      }

