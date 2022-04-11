//
//  PayTabView.swift
//  StoreDAYS
//
      import SwiftUI
      import PassKit

      struct PayTabView: View {

            private enum Tabs {
                  case applePay2, WalmartPay, otherPay
            }
            
            @EnvironmentObject var cartManager: CartManager
            @EnvironmentObject var localData: Data

            @State var user: String = ""
            @State private var name: String = ""
            @State private var expiration: String = ""
            @State private var invoiceAmt: Double = 0.00
            @State private var settleAmt: Double = 0.00
            @State private var showingPopup: Bool = true
            @State private var selectedPayTab: Tabs = .otherPay
            
         var body: some View {
               VStack{
                    Text("Settlement")
                          .font(.title)
                          .foregroundColor(.cyan)
                          .padding()
                    settleView
                     NavigationView {
                                NavigationLink {
                                      CSTabView()
                                }
                                label: {
                                        Text("For customer satisfaction!")
                                            .padding()
                                }
                          }
                    Spacer()
                }
                
                TabView(selection: $selectedPayTab) {
                  Group {
                    applePayTab
                   walmartPayTab
                    otherPayTab
                  }
                  .accentColor(.primary)
                }
                .accentColor(.cyan)
//                .edgesIgnoringSafeArea(edges)
                .statusBar(hidden: selectedPayTab == .otherPay)
              }
            
             }

      private extension PayTabView {
            
            var applePayTab: some View {
//                  Representable(action: action)


                  PaymentButton(action: cartManager.pay)
                      .padding()
                      .padding(.top)
                      .onDisappear {
                          if cartManager.paymentSuccess {
                              cartManager.paymentSuccess = false
                          }
                      }


//                  ApplePayView()
                  .tabItem {
                        Image("applepay")
                            .frame(width: 15.0, height: 15.0)
                        Label("Apple Pay", image: "applepay")
                  }
            }

            var walmartPayTab: some View {
                  T2View()
                  .tabItem {
                        Image("walmart")
                            .frame(width: 20.0, height: 20.0)
                       Label("Walmart Pay", image: "walmart")
                  }
            }

            var otherPayTab:  some View {
                  OtherPay()
                  .tabItem {
                        Image("cardImg")
                            .frame(width: 15.0, height: 15.0)
                       Label("Other Cards", image: "cardImg")
                  }
            }

            struct PaymentButton: View {
                  var action: () -> Void
                  
                  var body: some View {
                        Representable(action: action)
                              .frame(minWidth: 100, maxWidth: 400)
                              .frame(height: 45)
                              .frame(maxWidth: .infinity)
                  }
            }
            
            struct Representable: UIViewRepresentable {
                var action: () -> Void
                
                func makeCoordinator() -> Coordinator {
                    Coordinator(action: action)
                }
                
                func makeUIView(context: Context) -> UIView {
                      context.coordinator.button
                }
                
                func updateUIView(_ rootView: UIView, context: Context) {
                    context.coordinator.action = action
                }
            }
            
            class Coordinator: NSObject {
                var action: () -> Void
                var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .whiteOutline)
//                  let result = PaymentHandler.applePayStatus()
//                  var button: UIButton?
//
//                  if result.canMakePayments {
//                      button = PKPaymentButton(paymentButtonType: .book, paymentButtonStyle: .black)
//                      button?.addTarget(self, action: #selector(startPayment(total:completion:)), for: .touchUpInside)
//                  } else if result.canSetupCards {
//                      button = PKPaymentButton(paymentButtonType: .setUp, paymentButtonStyle: .black)
//                      button?.addTarget(self, action: #selector(startPayment(total:completion:)), for: .touchUpInside)
//                  }

                
                init(action: @escaping () -> Void) {
                    self.action = action
                    super.init()

                      button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
                }
                
                @objc
                func callback(_ sender: Any) {
                    action()
                }
            }
            
            var numberFormatter: NumberFormatter {
                  let formatter = NumberFormatter()
                  formatter.numberStyle = .currency
                  formatter.maximumFractionDigits = 2
                  formatter.locale = Locale.current

          return formatter
      }
      
      var settleView: some View {
            VStack{
                  HStack {
                        Text("Invoice Amount")
                              .font(.system(size: 20))
                              .fontWeight(.bold)
                              .padding()
                        TextField("", value: $invoiceAmt,  formatter: numberFormatter)
                              .multilineTextAlignment(.trailing)
                                       .keyboardType(.numberPad)
                                       .textFieldStyle(.roundedBorder)
                              .foregroundColor(Color.red)
                              .background(Color.cyan)
                              .padding()

                 }
                  HStack {
                        
                        Text("Money Owed")
                              .font(.system(size: 22))
                              .fontWeight(.bold)
                              .padding()
                        TextField("", value: $settleAmt,  formatter: numberFormatter)
                              .multilineTextAlignment(.trailing)
                                        .keyboardType(.numberPad)
                                        .textFieldStyle(.roundedBorder)
                              .foregroundColor(Color.red)
                              .background(Color.cyan)
                              .padding()
                  }
                  .background(Color.cyan)
        }
            .padding()
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.cyan, lineWidth: 4)
                )
      }
}

      struct PayTabView_Previews: PreviewProvider {
          static var previews: some View {
                PayTabView()
                  .environmentObject(CartManager())
          }
      }
