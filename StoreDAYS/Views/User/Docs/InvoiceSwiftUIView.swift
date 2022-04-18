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
    @State var firstName = ""
    
    
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
                .onAppear{
                    print("firstname:\(Data.initdata.UserInformation.FirstName)")
                    print("State:\(Data.initdata.AddressInformation.State)")
                    print("items\(Data.initdata.ItemedCart.description)")
                }
            
            
            
            Spacer()
            // Detail Invoice
            ScrollView{
                Section("Detail") {
                    List {
                        VStack{
                        ForEach(Data.initdata.ItemedCart){
                            item in
                            HStack{
                                AsyncImage(url: URL(string:item.Item.Img)) { image in
                                                                                    image.resizable()
                                                                                } placeholder: {
                                                                                    Color.red
                                                                                }
                                                                                .frame(width: 128, height: 128)
                                                                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                
                                    Text("* \(item.Item.Name)")
                                        .padding()
                                    Text("Sub-total \(item.Item.Cost)")
                            }
                            
                        }
                            
                        }
                        
                    }
                    
                }.frame(width: 450, height: 460, alignment: .center)
                    .border(Color(.gray), width: 1)// End Scroll View
            }
            
            // Total Invoice
            VStack(alignment: .trailing){
                HStack{
                    Text("Sub total Price:  \(Data.initdata.totalPrice)").foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                }                        .onAppear{
                    print("SubTotal:\(Data.initdata.totalPrice)")
                }

                HStack{
                    Text("Taxes:").foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                    
                    Text(NumberToDollar(Tottal: Data.initdata.taxes)).foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                }                        .onAppear{
                print("Taxes:\(Data.initdata.taxes)")
                }

                HStack{
                    HStack{
                        Text("   > $200.00 Free Shipping: ").foregroundColor(.black).font(.custom("Courier", fixedSize: 15  ))
                    }

                    HStack{
                        Text(NumberToDollar(Tottal: Data.initdata.shippingPrice)).foregroundColor(.black).font(.custom("Courier", fixedSize: 15  ))
                    }
                }
                Divider()
                Group{
                    Text("Total     \(NumberToDollar(Tottal: Data.initdata.totalInvoice))").foregroundColor(.black).font(.custom("Courier", fixedSize: 24))
                        .onAppear{print( "TotalInvoice:\(Data.initdata.totalInvoice)")
                            
                        }
                        

                    
                Spacer()
               
                Text("Addres \(Data.initdata.addres)").foregroundColor(.black).font(.custom("Courier", fixedSize: 13))
                  
                    ZStack(alignment:.trailing){
                        if  firstName.isEmpty {
                            Text("Adress \(Data.initdata.addres)").font(.caption)
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
                    
                         .sheet(isPresented: $animFlag2, content: {
                             PayTabView(user: "davisgon@gmail.com")
                         })
                }
                }
                Spacer()
            }.onAppear{ Data.initdata.calculateTotalPrice()}
            
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
