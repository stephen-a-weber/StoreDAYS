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
        
        NavigationView {
            List{
            Section("KITTENS") {
                
               
                ForEach (data.kittenNames.indices) { item in
                        
                    NavigationLink{  KittenDetailView(kittenName:data.kittenNames[item])  }
                        //put a detail view in for each item of each section
                        // replace stuff in {} of NavigationLink
                        // label below can be another more complex view w/ pic price
                        label : {
                            ItemCell(kittenName: data.kittenNames[item],litter:data.kittenLitterCount[item],price:data.kittenPrice[item])
                        }
                       // This creates dynamical list with a ForEach
                        // this can refer to a data collection with nameData.indices
                    }
               
                
            }
            Section("PUPPIES") {
                 
                ForEach (data.puppyNames.indices) { item in
                        
                        NavigationLink{ PuppyDetailView(puppyName:data.puppyNames[item])  }
                        // The NavigationLink works like a button , the closure above
                        // is the next view.
                        //
                        // below is just a label for NavigationLink
                        // in the {} of NavigationLink shows like protocol cell
                        // we can replace it with a complex cell view in another swiftui file
                        label : {
                            ItemCell2(puppyName:data.puppyNames[item],litter:data.puppyLitterCount[item],price:data.puppyPrice[item])
                        }
                        
                        
                        //                        label : {
//                            Text("Stock items \(item)")
//                        }

                        // this creates a dynamical list  for Stock type 2 with ForEach
                    
                    }
                    
                
            }
            
            Section("EXOTIC ANIMALS") {
                
                       
                ForEach (data.exoticNames.indices) { item in
                                
                                NavigationLink {ExoticDetailView(exoticName:data.exoticNames[item])   }// separate swiftUI file
                    label : {
                        ItemCell3(exoticName:data.exoticNames[item],exoticLitter:data.exoticLitterCount[item],exoticPrice:data.exoticPrice[item])
                    }
                    
                 
                            }
           
            }
            
        
        
        }
            .navigationTitle("HEre In the \(data.name)")
    }
}
}
    
struct StoreFront_Previews: PreviewProvider {
    static var previews: some View {
        StoreFront(data: Data())
    }
}
