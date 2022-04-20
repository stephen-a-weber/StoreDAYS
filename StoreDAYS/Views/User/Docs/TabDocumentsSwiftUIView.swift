//
//  TabDocumentsSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/8/22.
//

import SwiftUI

struct TabDocumentsSwiftUIView: View {
    @EnvironmentObject var data:Data
   
    var body: some View {
        TabView {
        
            
            InvoiceSwiftUIView().tabItem {
                
                Image(systemName: "doc")
                Text("Invoice")
                
            }
            
            PayTabView().tabItem {
                
                Image(systemName: "message")
                Text("Pay")
                
            }
            
            Tracking()
                .tabItem{
                    Label("Locations", systemImage:"globe.americas.fill")
                }
            
          
            
        }
    }
}

struct TabDocumentsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabDocumentsSwiftUIView()
            .environmentObject(Data())
    }
}
