//
//  TabSwiftMoreUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/6/22.
//

import SwiftUI

struct TabSwiftMoreUIView: View {
    @ObservedObject var data: Data
    var body: some View {
        TabView {
            
            VideoArkOfSuffering()
                 .tabItem {
                    Image(systemName: "play")
                    Text("Publicity")
                  }
            
            FeedbackSwiftUIView().tabItem {
                
                Image(systemName: "message")
                Text("Feedback")
                
            }
            
            InvoiceSwiftUIView(data: Data()).tabItem {
                
                Image(systemName: "doc")
                Text("Inv")
                
            }
            
            DashBoardSwiftUIView(data: Data()).tabItem {
                
                Image(systemName: "circle.dashed")
                Text("DashBoard")
                
            }
    //https://developer.apple.com/design/resources/#sf-symbols
    //            PaySwiftUIView(user: "Guest").tabItem { Label("Foto", systemImage: "square.grid.3x1.below.line.grid.1x2") }
            
        }
    }
}

struct TabSwiftMoreUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabSwiftMoreUIView( data: Data())
    }
}
