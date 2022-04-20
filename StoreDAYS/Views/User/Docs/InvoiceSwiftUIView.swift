//
//  FactSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/8/22.
//

import SwiftUI
//moved it outside of data to decouple it scope so its lets static
struct InvoiceSwiftUIView: View {
    @State var  LoggedIN = false
    @State var presenting = false

    func calculateTotalPrice() {
        print("Caculating for : \(Data.initdata.ItemedCart.description)")
        var dollars=0.0
        for item in Data.initdata.ItemedCart {
            dollars+=item.Item.Cost
        }
       totalPrice =  dollars

    // Shipping

        if dollars > 200 {
            shippingPrice =  0.00
        }else{
            shippingPrice =  10.00
        }
      
    
       let date=Date()
        var dateComponentadder = DateComponents()
        
        if dollars > 200 {
            dateComponentadder.day=7
            let futureDate = Calendar.current.date(byAdding: dateComponentadder, to: date) ?? Date()

            let Shippment=ShippingModels(ID: 0, ShippingType: "Free", Cost: 0, ETA: DatetoString(day: futureDate), User_ID: Data.initdata.UserInformation.ID, Status: "Inprogress", Address_ID: 0)
            data.ShippingInformation=Shippment
            Data.initdata.ShippingInformation=Shippment
            dollars += 0
        }else{
            dateComponentadder.day=14
            let futureDate = Calendar.current.date(byAdding: dateComponentadder, to: date) ?? Date()
            let Shippment=ShippingModels(ID: 0, ShippingType: "Standard", Cost: 10, ETA: DatetoString(day: futureDate), User_ID: Data.initdata.UserInformation.ID, Status: "Inprogress", Address_ID: 0)
            data.ShippingInformation=Shippment
            Data.initdata.ShippingInformation=Shippment
            dollars += 10
        }
    let total = dollars + (dollars * 0.07)
        // Taxes

            var Tx = (dollars * 0.07)
            Tx = round(Tx * 100) / 100
            
         
            
            taxes =  Tx

        
        

        var TTL = total
        TTL = round(TTL * 100) / 100
        
        totalInvoice =  total
        Data.initdata.totalInvoice=totalInvoice
        data.totalInvoice=totalInvoice
    }
    @State var message = ""
    @ObservedObject var data: Data
    @State var releaseDate = Date()
    @State var myColor = "myBlue"
    @State var animFlag2 = false
    @State var firstName = ""
    @State var totalPrice : Double = 0.0
    @State var shippingPrice : Double = 10.0
    @State var taxes         : Double = 0.7
    @State var totalInvoice   : Double = 0.0
    
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
                                Text("Sub-total \(NumberToDollar(Tottal: item.Item.Cost))")
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
                    Text("Sub total Price:  \(NumberToDollar(Tottal: totalPrice))").foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                }                        .onAppear{
                    print("SubTotal:\(Data.initdata.totalPrice)")
                }

                HStack{
                    Text("Taxes:").foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                    
                    Text(NumberToDollar(Tottal: taxes)).foregroundColor(.black).font(.custom("Courier", fixedSize: 15))
                }                        .onAppear{
                print("Taxes:\(Data.initdata.taxes)")
                }

                HStack{
                    HStack{
                        Text("   > $200.00 Free Shipping: ").foregroundColor(.black).font(.custom("Courier", fixedSize: 15  ))
                    }

                    HStack{
                        Text(NumberToDollar(Tottal: shippingPrice)).foregroundColor(.black).font(.custom("Courier", fixedSize: 15  ))
                    }
                }
                Divider()
                Group{
                    Text("Total     \(NumberToDollar(Tottal: totalInvoice))").foregroundColor(.black).font(.custom("Courier", fixedSize: 24))
                        .onAppear{print( "TotalInvoice:\(Data.initdata.totalInvoice)")
                            
                        }
                        

                    
                Spacer()
                                    Text("\(Data.initdata.AddressInformation.Street), \(Data.initdata.AddressInformation.City), \(Data.initdata.AddressInformation.State) \(Data.initdata.AddressInformation.Zip)").foregroundColor(.black).font(.custom("Courier", fixedSize: 13))
                  
                    Text("For: \(Data.initdata.UserInformation.FirstName) \(Data.initdata.UserInformation.LastName)")
                    Text("Paying With \(Data.initdata.CardInformation.Name)")
                       
             
                
                Spacer()
                    if LoggedIN{
                        Button{
                            DynamicCheckOut(data: data)
                            presenting.toggle()
                        }label: {
                            Text("PAY")
                                .fontWeight(.bold)
                                .foregroundColor(Color(myColor))
                                .frame( maxWidth: .infinity,  alignment: .center)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                                .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                                    lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                        }.fullScreenCover(isPresented: $presenting){
                            ThankYouView(data: data)
                        }
                    }else{
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
                }}
                }
                Spacer()
            }
            
        }.onAppear{
            calculateTotalPrice()
            Data.initdata.calculateTotalPrice()}
        .onAppear {
            print("User ID: \(Data.initdata.UserInformation.ID)")
            print("Address ID: \(Data.initdata.AddressInformation.ID)")
            print("Card ID: \(Data.initdata.CardInformation.ID)")
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
