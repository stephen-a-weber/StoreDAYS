//
//  StoreFront.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//

import SwiftUI

struct StoreFront: View {
    @EnvironmentObject var data:Data
    var body: some View {
        
      //  NavigationView {
            List{
            Section("KITTENS") {
                
               
                ForEach (data.kittenViewOrders.indices ) { item in
               
                    NavigationLink{  KittenDetailView(index: item)  }
                        //put a detail view in for each item of each section
                        // with NavigationLink to KittenDetailView()
                        
                        label : {
                            ItemCell(kittenName: data.kittenViewOrders[item].pictureName,litter:data.kittenViewOrders[item].inventoryNumber,price:data.kittenViewOrders[item].price)
                        }
                       // This creates dynamical list with a ForEach
                        // this can refer to a data collection with nameData.indices
                    }
               
                
            }
            Section("PUPPIES") {
                 
                ForEach (data.puppyViewOrders.indices) { item in
                        
                    NavigationLink{ PuppyDetailView(index: item) }
                        // The NavigationLink works like a button , the closure above
                        // is the next view. called PuppyDetailView
                        //
                        // below is just a label for NavigationLink
                        // in the {} of NavigationLink shows like protocol cell
                        // we can replace it with a complex cell view in another swiftui file
                        label : {
                            ItemCell2(puppyName: data.puppyViewOrders[item].pictureName,litter:data.puppyViewOrders[item].inventoryNumber,price:data.puppyViewOrders[item].price)
                        }
                        
                        
                    
                    }
                    
                
            }
            
            Section("EXOTIC ANIMALS -- Suggested Pets") {
                //Like the other two sections above. This one makes a row for each
                //exotic animal.
                // these rows are wrapped in a NavigationLink
                // which if you tap on the row takes you to a Detailed View of the row chosen
                // ExoticDetailView
                       
                ForEach (data.exoticViewOrders.indices) { item in
                                
                    NavigationLink {ExoticDetailView(index: item) }
                    label : {
                        ItemCell3(exoticName: data.exoticViewOrders[item].pictureName,exoticLitter:data.exoticViewOrders[item].inventoryNumber,exoticPrice:data.exoticViewOrders[item].price)
                    }
                    
                 
                            }
           
           }
            
        
        
        }
            .navigationTitle("Pet Store")//("HEre In the \(data.name)")
            
            .navigationBarTitleDisplayMode(.inline)
    }
//}
}
    
struct StoreFront_Previews: PreviewProvider {
    static var previews: some View {
        StoreFront()
            .environmentObject(Data())
    }
}
