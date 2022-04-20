//
//  TabDocumentsSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/8/22.
//

import SwiftUI

struct TabDocumentsSwiftUIView: View {
    @ObservedObject var data: Data
   
    var body: some View {
        NavigationView{TabView {
        
            
            InvoiceSwiftUIView(data: data).tabItem {
                
                Image(systemName: "doc")
                Text("Invoice")
                
            }
            
            PayTabView(user: "davisgon@gmail.com").tabItem {
                
                Image(systemName: "message")
                Text("Pay")
                
            }
            
            Tracking(data:data)
                .tabItem{
                    Label("Locations", systemImage:"globe.americas.fill")
                }
            
          
            
        }}
    }
}

struct TabDocumentsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabDocumentsSwiftUIView(data: Data())
    }
}
