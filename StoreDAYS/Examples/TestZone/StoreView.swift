//
//  StoreView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//

import SwiftUI

struct StoreView: View {
    var body: some View {
        
      //  NavigationView {
            List{
            Section("KITTENS") {
                ForEach(Store.TheStore.allItems.indices){ item in
                    NavigationLink{  DetailView(data: Store.TheStore.allItems[item], kittenName:Store.TheStore.allItems[item].Name)  }
                        //put a detail view in for each item of each section
                        // with NavigationLink to KittenDetailView()
                        
                        label : {
                            ViewCell(Name: Store.TheStore.allItems[item].Name,litter: Store.TheStore.allItems[item].Availability,price:Store.TheStore.allItems[item].Cost)
                        }
                }
               
               
                
            }
            .navigationTitle("HEre In the ")
            .navigationBarTitleDisplayMode(.inline)
    }
    }
}
    
struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
