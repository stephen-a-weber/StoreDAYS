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
            
             
                 
            
            FeedbackSwiftUIView().tabItem {
                
                Image(systemName: "message")
                Text("Feedback")
                
            }
            
            DashBoardSwiftUIView(data: Data()).tabItem {
                
                Image(systemName: "face.dashed")
                Text("DashBoard")
                
            }
            
        }
    }
}

struct TabSwiftMoreUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabSwiftMoreUIView( data: Data())
    }
}
