//
//  T2.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/3/22.
//

import SwiftUI
import MapKit

struct T2View: View {
    var body: some View {
          VStack {
                CustomAnnotationMapView(region: MKCoordinateRegion(center: .init(latitude: 40.758185976198675, longitude: -73.98553187336162),
                                                                latitudinalMeters: 1000, longitudinalMeters: 1000))
                  .frame(height: 350)
              
              VStack(alignment: .leading) {
                  Text("Time Square")
                      .font(.title)
                  HStack {
                      Text("🐕‍🦺 🐈‍⬛ 🐍 They are heading to you!")
                          .font(.subheadline)
                      
                      Spacer()
                      
                      Text("Manhattan")
                          .font(.subheadline)
                }
            }
            .padding()
        }
    }
}

struct T2View_Previews: PreviewProvider {
    static var previews: some View {
          Group {
                T2View()
          }
    }
}

