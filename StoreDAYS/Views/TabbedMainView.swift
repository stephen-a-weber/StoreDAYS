    //
    //  TabbedMainView.swift
    //  StoreDAYS
    //
    //  Created by stephen weber on 3/30/22.
    //

import SwiftUI

struct TabbedMainView: View {
    @StateObject var data = Data()
    @State private var showStore = true
    
        // ObservedObject pulls from @StateObject data in StoreDAYSApp
    
    
    var body: some View {
        
            //    This is a wrapper view around three views
            // There is a list view StoreFront which gives link
            // for each animal grouped in sections
            // for adding to cart
            //
            // the Location has all the animals spread across the
            // planet in a map where each animal image is clickable
            // if you want to add it to the cart
        
            // Both of these directs to a detailed view with individual
            // animal chosen and ability to add to card
        
            // Finally the cart view.
        
            // each are separate files under the same used name
            //  NavigationView {
            //Color.clear.zIndex(0)
        NavigationView{
            
            TabView {
                StoreFront()
                    .tabItem{
                        Label("Animals",systemImage:"pawprint.fill")
                    }
                
                Tracking()
                    .tabItem{
                        Label("Locations", systemImage:"globe.americas.fill")
                    }
                
                
                
                CheckOutView()
                    .tabItem{
                        Label("Cart",systemImage:"cart.fill")
                        
                    }
                
            }
            
            .ignoresSafeArea()
              
        }
            
            
            .environmentObject(data)
        
    }
}


struct TabbedMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedMainView()
            .environmentObject(Data())
        
    }
}
