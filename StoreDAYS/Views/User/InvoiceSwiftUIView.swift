//
//  FactSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/8/22.
//

import SwiftUI

struct InvoiceSwiftUIView: View {
    @EnvironmentObject var data:Data
    @State var message = ""
   // @ObservedObject var data: Data
    @State var releaseDate = Date()
    @State var myColor = "myBlue"
    @State var animFlag2 = false
    @State var firstName = ""
    
 
  
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
                        ForEach(data.cartOrders) { item in
                            HStack {
                                Image(item.pictureName)
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
                Group{
                Text("Total     \(data.totalInvoice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 24))
                Spacer()
               
                Text("Address \(data.address)").foregroundColor(.black).font(.custom("Courier", fixedSize: 13))
                  
                    ZStack(alignment:.trailing){
                        if  firstName.isEmpty {
                            Text("Address \(data.address)").font(.caption)
                                .foregroundColor(.gray)
                        }
                        TextField("", text: $firstName)
                    }
                 
                       
             
                
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
                    
                        .fullScreenCover(isPresented: $animFlag2) {
                            PayTabView()
                        }
                }
                }
                Spacer()
            }.padding(.all)
            
        }
    }
    func continueVideo() -> Bool {
        return true
    }
}

struct InvoiceSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceSwiftUIView()
    }
}
