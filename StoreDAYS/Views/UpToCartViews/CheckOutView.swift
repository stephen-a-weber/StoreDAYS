//
//  CheckOutView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var data:Data
    
    var totalPrice = "$0.01"
    
 
    
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
                
                ForEach(data.cartOrders.indices) { item in
                    HStack {
                        Image(data.cartOrders[item].pictureName)
                            .resizable()
                            .frame(width:100,height:100)
                            .padding()
                        Spacer()
                        VStack{
                            Text("You ordered \(data.cartOrders[item].name)")
                            .padding()
                            Text("The price is \(data.cartOrders[item].price)")
                        }
                    }
                }
                .onDelete(perform: remove)
                .onAppear(perform: data.calculateTotalPrice)
                Text("Total Price = \(data.totalPrice)")
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
                        
                       // InvoiceSwiftUIView(data: data)
                        
                    }
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
        data.cartOrders.remove(atOffsets: offsets)
    }
    
    
    
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView()
            .environmentObject(Data())
    }
}
