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
            VStack{
                HStack{
                    Image("invoice").resizable().frame(width: 150, height: 100, alignment: .leading)
                    
                    Text("# NUMBER       A- 75423137").foregroundColor(.black).font(.custom("Courier", fixedSize: 25))
                        .padding()
                }
            }  .frame(width: 400, height: 100, alignment: .center)
                .border(Color(.gray), width: 0).padding()
            
            
            
            Spacer()
            // Detail Invoice
            ScrollView{
                Section("Detail") {
                    List {
                        ForEach(data.order, id:\.self) { item in
                            HStack {
                                Image(item.name)
                                    .resizable()
                                    .frame(width:100,height:100)
                                    .padding()
                                Spacer()
                                VStack{
                                    Text("* \(item.name)")
                                        .padding()
                                    Text("Sub-total \(item.price)")
                                }
                            }
                        }
                        .onDelete(perform: remove)
                        .onAppear(perform: data.calculateTotalPrice)
                    }
                    
                }.frame(width: 450, height: 460, alignment: .center)
                    .border(Color(.gray), width: 1)// End Scroll View
            }
                
                
                VStack(alignment: .trailing){
                    Text("Total Price = \(data.totalPrice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 24))
                    Text("Shipping =      \(data.shippingPrice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 12))

                    Text("Adress:33 60 NY city Patagonia Argentina").foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
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
