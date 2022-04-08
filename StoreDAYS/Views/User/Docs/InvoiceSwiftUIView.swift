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
        VStack {
            VStack{
                // Header
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
     
                        .onAppear(perform: data.calculateTotalPrice)
                    }
                    
                }.frame(width: 450, height: 460, alignment: .center)
                    .border(Color(.gray), width: 1)// End Scroll View
            }
                
                // Total Invoice
                VStack(alignment: .trailing){
                    Text("Total Price = \(data.totalPrice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 24))
                    if   Float(data.shippingPrice) ?? 0  < 200 {
                    Text("Shipping =      \(data.shippingPrice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 12))
                    }else{
                        Text("Amount > 200 Free Shipping =      \(0)").foregroundColor(.black).font(.custom("Courier", fixedSize: 12))
                    }

                    Text("Adress:33 60 NY city Patagonia Argentina").foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                }
            
        }
    }
     
}

struct InvoiceSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceSwiftUIView(data: Data())
    }
}
