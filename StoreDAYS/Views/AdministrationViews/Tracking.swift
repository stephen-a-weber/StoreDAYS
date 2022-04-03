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
   // As in all of the App we are using Data.swift which is a class
    //for our data
    // when database arrives the same will hold true for passed data
    // holding ObservedObject and calling id @StateObject in
    // StoreDAYSApp
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.11, longitude: -88.29),
    span: MKCoordinateSpan(latitudeDelta: 40,longitudeDelta: 40)
    )
    // currently region is like a camera for this view above the map
    // the location is above Mississippi so that a good range
    // of animals are in view in our typical North American view
    
    
    var body: some View {
        
        // The Body contains just a Map
        // the @State variable is like a camera as you can scroll
        // around Maps
        
        // It is Annotated with our Data which at the moment is
        // one grouping of all animals locations
        // each one in a struct with their name and the CL..2D
        // latitude longitude Coordinate.
        
       // As each location is annotated with the MapAnnotation closure
        // a NavigationLink is wrapped around that.
        // Should you click on an image on the map
        // It takes you to a detailview which allows you
        // to see a large image and purchase said animal.
        
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
