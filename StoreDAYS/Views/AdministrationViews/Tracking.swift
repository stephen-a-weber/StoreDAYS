//
//  Tracking.swift
//  StoreDAYS
//
//  Created by stephen weber on 4/2/22.
//
import MapKit
import SwiftUI




struct Tracking: View {
 //   @EnvironmentObject var data : Data
   @ObservedObject var data: Data
   
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.11, longitude: -88.29),
    span: MKCoordinateSpan(latitudeDelta: 40,longitudeDelta: 40)
    )
    
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: data.locations) {
            places in
            MapAnnotation(coordinate: places.coordinate){
                NavigationLink(destination: ExoticDetailView(data:data,exoticName: places.name)
                ){
                    Image(places.name)
                    .resizable()
                    .cornerRadius(10)
                    .frame(width:60,height:60)
                    .shadow(radius:7)
            }
            }
        }
             .navigationTitle("Tracking Locations")
            
    }
}

struct Tracking_Previews: PreviewProvider {
    static var previews: some View {
        Tracking(data: Data())
    }
}
