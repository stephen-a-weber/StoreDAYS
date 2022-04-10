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
    @State var releaseDate = Date()
    
 
       
       static let stackDateFormat: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss z"
           return formatter
       }()
    
    // *******
    var body: some View {
        VStack {
            VStack{
                // Header
                HStack{
                    VStack{
                    Image("invoice").resizable().frame(width: 150, height: 100, alignment: .leading)
                    Text(releaseDate, format: Date.FormatStyle().year().month().day().weekday())
                    }
                        VStack{
                    Text("# NUMBER       A- 75423137" ).foregroundColor(.black).font(.custom("Courier", fixedSize: 25))
                        .padding()
                    }
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
                        .onAppear(perform: data.calculateShipping)
                        .onAppear(perform: data.calculateTax)
                    }
                    
                }.frame(width: 450, height: 460, alignment: .center)
                    .border(Color(.gray), width: 1)// End Scroll View
            }
                
                // Total Invoice
                VStack(alignment: .trailing){
                    Text("Total Price = \(data.totalPrice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 24))
                    Text("             Taxes =      \(data.taxes)").foregroundColor(.black).font(.custom("Courier", fixedSize: 12))
                    Text("> $200.00 Free Shipping =      \(data.shippingPrice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 12))
                 
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
