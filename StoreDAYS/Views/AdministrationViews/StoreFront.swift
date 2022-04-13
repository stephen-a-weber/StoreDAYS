//
//  StoreFront.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//

import SwiftUI

struct StoreFront: View {
    @ObservedObject var data : Data
    var body: some View {
        
      //  NavigationView {
            List{
            Section("KITTENS") {
                
               
                ForEach (data.kittenNames.indices) { item in
               
                    NavigationLink{  KittenDetailView(data: data, kittenName:data.kittenNames[item],kittenPrice:data.kittenPrice[item])  }
                        //put a detail view in for each item of each section
                        // with NavigationLink to KittenDetailView()
                        
                        label : {
                            ItemCell(kittenName: data.kittenNames[item],litter:data.kittenLitterCount[item],price:data.kittenPrice[item])
                        }
                       // This creates dynamical list with a ForEach
                        // this can refer to a data collection with nameData.indices
                    }
               
                
            }
            Section("PUPPIES") {
                 
                ForEach (data.puppyNames.indices) { item in
                        
                    NavigationLink{ PuppyDetailView(data: data,puppyName:data.puppyNames[item],puppyPrice:data.puppyPrice[item])  }
                        // The NavigationLink works like a button , the closure above
                        // is the next view. called PuppyDetailView
                        //
                        // below is just a label for NavigationLink
                        // in the {} of NavigationLink shows like protocol cell
                        // we can replace it with a complex cell view in another swiftui file
                        label : {
                            ItemCell2(puppyName:data.puppyNames[item],litter:data.puppyLitterCount[item],price:data.puppyPrice[item])
                        }
                        
                        
                    
                    }
                    
                
            }
            
            Section("EXOTIC ANIMALS -- Suggested Items") {
                //Like the other two sections above. This one makes a row for each
                //exotic animal.
                // these rows are wrapped in a NavigationLink
                // which if you tap on the row takes you to a Detailed View of the row chosen
                // ExoticDetailView
                       
                ForEach (data.exoticNames.indices) { item in
                                
                    NavigationLink {ExoticDetailView(data: data,exoticName:data.exoticNames[item],exoticPrice:data.exoticPrice[item])   }
                    label : {
                        ItemCell3(exoticName:data.exoticNames[item],exoticLitter:data.exoticLitterCount[item],exoticPrice:data.exoticPrice[item])
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
        StoreFront(data: Data())
    }
}
