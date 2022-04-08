//
//  FactSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/8/22.
//

import SwiftUI

struct InvoiceSwiftUIView: View {
    @State var message = ""
    @ObservedObject var data: Data
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
        
        VStack {
            
            Text("TRAKING").foregroundColor(Color("myBlue"))
            Tracking(data:data)
                .tabItem{
                    Label("Locations", systemImage:"globe.americas.fill").frame(width: 20, height: 10, alignment: .center)
                }
            
            VStack{
                HStack{
                    Image("invoice").resizable().frame(width: 150, height: 100, alignment: .leading)
                
                Text("# NUMBER: A - 75423137").padding()
                }
            }  .frame(width: 400, height: 100, alignment: .center)
                .border(Color(.gray), width: 0).padding()
              
      
            
            // Detail Invoice
            ScrollView{
            Section("Detail") {
                 
                ForEach (data.puppyNames.indices) { item in
//                    if data.count == 3 {
//                        break
//                    }
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
            
            Section("EXOTIC ANIMALS") {
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
            
            }.frame(width: 400, height: 300, alignment: .center)
                .border(Color(.gray), width: 1)// End Scroll View
            
            
            List {
                
                ForEach(data.order, id:\.self) { item in
                    HStack {
                        Image(item.name)
                            .resizable()
                            .frame(width:100,height:100)
                            .padding()
                        Spacer()
                        VStack{
                            Text("You ordered \(item.name)")
                                .padding()
                            Text("The price is \(item.price)")
                        }
                    }
                }
                .onDelete(perform: remove)
                .onAppear(perform: data.calculateTotalPrice)
                VStack(alignment: .trailing){
                Text("Total Price = \(data.totalPrice)")
                    Spacer()
                Text("Adress:33 60 NY city Patagonia Argentina")
            }
            }
           
          
            
            
        }
    }
    
    // remove is a helper function used above to remove choses
    // from the cart and the global variables we are using under data
    func remove(at offsets: IndexSet) {
        data.order.remove(atOffsets: offsets)
    }
}

struct InvoiceSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceSwiftUIView(data: Data())
    }
}
