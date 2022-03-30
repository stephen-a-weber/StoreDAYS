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
            Section("Stock TYPE 1") {
                
               
                    ForEach (0..<7,id:\.self) { item in
                        
                        NavigationLink{  Text("Detail here View : \(item)")   }
                        //put a detail view in for each item of each section
                        // replace stuff in {} of NavigationLink
                        // label below can be another more complex view w/ pic price
                        label : {
                            Text("Inventory items \(item)")
                        }
                       // This creates dynamical list with a ForEach
                        // this can refer to a data collection with nameData.indices
                    }
               
                
            }
            Section("Stock TYPE 2") {
                
              
                
                    ForEach (0..<7,id:\.self) { item in
                        
                        NavigationLink{ Text("TheDetails of a View2 : \(item)")  }
                        // The NavigationLink works like a button , the closure above
                        // is the next view.
                        //
                        // below is just a label for NavigationLink
                        // in the {} of NavigationLink shows like protocol cell
                        // we can replace it with a complex cell view in another swiftui file
                        label : {
                            Text("Stock items \(item)")
                        }
                     // this creates a dynamical list  for Stock type 2 with ForEach
                    
                    }
                    
                
            }
            
            Section("Stock TYPE 3") {
                
                       
                            ForEach (0..<7,id:\.self) { item in
                                
                                NavigationLink { Text("hello world \(item)!")  }// separate swiftUI file
                            label: {
                                Text("Number of  items \(item)") // label acts like a button link
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
