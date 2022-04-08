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
        TabView {
            
    
            
            PaySwiftUIView(user: "davisgon@gmail.com").tabItem {
                
                Image(systemName: "message")
                Text("Pay")
                
            }
            
            InvoiceSwiftUIView(data: Data()).tabItem {
                
                Image(systemName: "doc")
                Text("Invoice")
                
            }
            
          
            
        }
    }
}

struct TabDocumentsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabDocumentsSwiftUIView(data: Data())
    }
}
