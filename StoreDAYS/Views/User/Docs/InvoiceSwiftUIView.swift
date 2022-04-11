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
    @State var myColor = "myBlue"
    @State var animFlag2 = false
    
    
    
    //       static let stackDateFormat: DateFormatter = {
    //           let formatter = DateFormatter()
    //           formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss z"
    //           return formatter
    //       }()
    
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
                        .onAppear(perform: data.calculateTotalInvoice)
                    }
                    
                }.frame(width: 450, height: 460, alignment: .center)
                    .border(Color(.gray), width: 1)// End Scroll View
            }
            
            // Total Invoice
            VStack(alignment: .trailing){
                HStack{
                    Text("Sub total Price:  \(data.totalPrice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                }
                HStack{
                    Text("Taxes:").foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                    
                    Text(data.taxes).foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                }
                HStack{
                    HStack{
                        Text("   > $200.00 Free Shipping: ").foregroundColor(.black).font(.custom("Courier", fixedSize: 15  ))
                    }
                    HStack{
                        Text(data.shippingPrice).foregroundColor(.black).font(.custom("Courier", fixedSize: 15  ))
                    }
                }
                Divider()
                Text("Total     \(data.totalInvoice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 24))
                Spacer()
             
                Text("Adress:33 60 NY city Patagonia Argentina        ").foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                Spacer()
                Button(action: {
                    animFlag2 = true
                }) {
                    Text("PAY")
                        .fontWeight(.bold)
                        .foregroundColor(Color(myColor))
                        .frame( maxWidth: .infinity,  alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                            lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                    
                         .sheet(isPresented: $animFlag2, content: {
                             PayTabView(user: "davisgon@gmail.com")
                         })
                }
                Spacer()
            }
            
        }
    }
    func continueVideo() -> Bool {
        return true
    }
}

struct InvoiceSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceSwiftUIView(data: Data())
    }
}
