//
//  SwiftUIView.swift
//  StoreDAYS
//
//  Created by admin on 4/7/22.
//

import SwiftUI

struct tabs: View {
    @ObservedObject var data : Data

    var body: some View {
        TabView {
            
            SwiftUIAPIView(data:data).tabItem {
                Label("animals",systemImage:"pawprint.fill")
            }
                   
                   
                   
                   
            CartView(data: data)
                .tabItem{
                   Label("Cart",systemImage:"cart.fill")
                       
                       }
                
               }
               }    }


struct tabs_Previews: PreviewProvider {
    static var previews: some View {
        tabs(data:Data())
    }
}
