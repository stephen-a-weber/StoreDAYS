//
//  TabbedMainView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct TabbedMainView: View {
    @ObservedObject var data : Data
    var body: some View {
       
        TabView {
            StoreFront(data:data)
                .tabItem{
                    Label("Animalss",systemImage:"pawprint.fill")
                }
            
            CheckOutView(data:data)
                .tabItem{
            Label("Cart",systemImage:"cart.fill")
                
                }
            
        }
        }
}

struct TabbedMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedMainView(data: Data())
        
    }
}
