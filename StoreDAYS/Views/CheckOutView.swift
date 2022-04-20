//
//  CheckOutView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var data:Data
    
    
 
    
    // from the @StateObject
    
    var body: some View {
    
            Section{
                VStack {
                    
                  // Using Section and List for some background
                // distinct looks.
                    // this displays the chosen images of each
                    // of the animals that you placed in the
                    //cart
                    
            List {
                
                ForEach(data.cartOrders) { item in
                    HStack {
                        Image(item.pictureName)
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
                       // testPage()
                         LoginSwiftUIView( )
                        
                    }
                label: { Text("Total : \(data.totalPrice)")
                        .padding()
                        Text("Continue To Payment")
                            .fontWeight(.bold)
                            .foregroundColor(Color("myBlue"))
                            .frame( maxWidth: .infinity,  alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("myBlue"),lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                    }
                    Spacer()
              
                
                
            
               }
            }
            .navigationTitle("Your Future Friends :")
            .listStyle(InsetGroupedListStyle())
         
            
            
            
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
