//
//  SwiftUIView.swift
//  StoreDAYS
//
//  Created by admin on 4/7/22.
//

import SwiftUI

struct tabs: View {
    @ObservedObject var data : ItemContainer

    var body: some View {
        TabView {
            SwiftUIAPIView().tabItem {
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
        tabs(data:ItemContainer())
    }
}
