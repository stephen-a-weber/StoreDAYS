//
//  CheckOutView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct CartView: View {
    static var cart:[ItemContainer]=[ItemContainer]()
    @ObservedObject var data=Store.TheStore.Cart
    // Using the ObservedObject from the @StateObject from StoreDAYSApp
    
    var body: some View {
    //    NavigationView {
            Section{
                VStack {
                    
                  // Using Section and List for some background
                // distinct looks.
                    // this displays the chosen images of each
                    // of the animals that you placed in the
                    //cart
                    
            List {
                
                ForEach(Store.TheStore.Cart.order.indices) { item in
                    HStack {
                        Text(Store.TheStore.Cart.order[item].Name)
                        AsyncImage(url: URL(string: Store.TheStore.Cart.order[item].Item.Img)) { image in
                                                                           image.resizable()
                                                                       } placeholder: {
                                                                           Color.red
                                                                       }
                                                                       .frame(width: 128, height: 128)
                                                                       .clipShape(RoundedRectangle(cornerRadius: 25))
                        Spacer()
                        Text("You ordered \(Store.TheStore.Cart.order[item].Name)")
                            .padding()
                    }
                }
                
                .onDelete(perform: remove)
                
            }
                    
               // The List has a onDelete method which allows
            /// users to change their mind about their future pets.
                    ///  the function remove is below
                    
            Spacer()
               Spacer()
                    
                    // Near bottom there is a button here to
                    // take your cart over to checkout.
                    // currently this view is part of a
                    // TABBED VIEW
                    // so you can easily see what is in the cart
                    // add more or as the button is for go to purchase
                    NavigationLink {
                        
                        LoginSwiftUIView()}
                label: {
                        Text("Continue To Payment")
                            .fontWeight(.bold)
                            .foregroundColor(Color("myBlue"))
                            .frame( maxWidth: .infinity,  alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("myBlue"),lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                    }
                    Spacer()
              
                
                
            
        //        }
            }
            .navigationTitle("Your Future Friends :")
            .listStyle(InsetGroupedListStyle())
         
            
            
            
        }
        
    }
    
    // remove is a helper function used above to remove choses
    // from the cart and the global variables we are using under data
    func remove(at offsets: IndexSet) {
        Store.TheStore.Cart.order.remove(atOffsets: offsets)
          }
    
    
    
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(data:ItemContainer())
    }
}
