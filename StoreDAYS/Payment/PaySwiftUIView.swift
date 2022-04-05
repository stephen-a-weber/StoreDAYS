//
//  PaySwiftUIView.swift
//  StoreDAYS
//

//

      //
      //  PaySwiftUIView.swift
      //  StoreDAYS
      //

      //

      import SwiftUI

      struct PaySwiftUIView: View {
            @State var user: String = ""
            @State private var name: String = ""
            @State private var expiration: String = ""
            @State private var invAmt = 0
            @State private var creditAmtApplied = 0
            @State private var settleAmt = 0
            @State private var creditAmtLeft = 0


            var itemCost = 10_000
            let shippingCost = 2_500

          var body: some View {
                let applePay = ApplePayManager(countryCode: "US", currencyCode: "USD", itemCost: itemCost, shippingCost: shippingCost)
                NavigationView {

                      VStack{
                            VStack{
                                  HStack {
                                        Text("Invoice Amount")
                                              .font(.system(size: 20))
                                              .fontWeight(.bold)
                                              .padding()
                                        Text("$$")
                                        Text("Button to Review")
                                 }
                                 VStack {
                                       HStack{
                                        Text("Your Credit   Balance")
                                              .font(.system(size: 16))
                                              .fontWeight(.bold)
                                              .padding()
                                             Text("$$")
                                  }
                                       VStack {
                                             Text("RB1: Apply whole bal")
                                             HStack {
                                                   Text("RB2")
//                                                   Divider()
                                                   Text("Input for partial")
                                             }
                                       }
                                  }
                                  Divider()

                                  HStack {
                                        Text("Money Owed")
                                              .font(.system(size: 22))
                                              .fontWeight(.bold)
                                              .padding()
                                        Text("$$")
                                  }
                                  .background(Color.cyan)
                        }
                            .padding()
                            .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.cyan, lineWidth: 4)
                                )
                  Spacer()
                            
                     PaymentButton(action: {})
                        .frame(minWidth: 400, maxWidth: 400)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .onTapGesture {
                              applePay.buyBtnTapped()
                        }

                    NavigationLink {
                          CSTabView()
                    }
                label: {
                        Text("For customer satisfaction!")
                            .foregroundColor(Color.black)
                    }
                  }
                }
          }
      }

      struct PaySwiftUIView_Previews: PreviewProvider {
          static var previews: some View {
              PaySwiftUIView(user: "ddt")
          }
      }

 
