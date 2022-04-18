//
//  PayTabView.swift
//  StoreDAYS
//
import SwiftUI
import PassKit

class Model: ObservableObject {
    @Published var invoiceAmount: Double = 0.0
}



struct PayTabView: View {

      @ObservedObject var model = Model()
      
      private enum Tabs {
            case applePay2, WalmartPay, otherPay
      }

      func formatFunction(number: Double) -> String {
          Formatter.number.string(for: number) ?? ""
      }

      @EnvironmentObject var cartManager: CartManager
      @ObservedObject var cart = Data()

      @State var user: String = ""
      @State private var name: String = ""
      @State private var expiration: String = ""
      @State private var invoiceAmt: Double = 0.00
      @State private var owedAmt: Double = 0.00
      @State private var settledAmt: Double = 0.00
      @State private var showingPopup: Bool = true
      @State private var selectedPayTab: Tabs = .otherPay
      
      init() {
            self.updateSettlementDisplay(amount: 50)
      }
         var body: some View {
               VStack{
                    Text("Settlement")
                          .font(.title)
                          .foregroundColor(.cyan)
                          .padding()
                    settleView
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
                .statusBar(hidden: selectedPayTab == .otherPay)
      }
}

extension Formatter {
    static let number: NumberFormatter = {
          let formatter = NumberFormatter()
          formatter.numberStyle = .currency
          formatter.maximumFractionDigits = 2
          formatter.locale = Locale.current
        return formatter
    }()
}

extension PayTabView {
      var applePayTab: some View {

      PaymentButton(action: cartManager.pay)
          .padding()
          .padding(.top)
          .onDisappear {
              if cartManager.paymentSuccess {
                  cartManager.paymentSuccess = false
              }
          }
            .tabItem {
                  Image("applepay")
                      .frame(width: 20.0, height: 20.0)
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
                      .frame(width: 20.0, height: 20.0)
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
          
          @objc func callback(_ sender: Any) {
              action()
          }
      }
      
var settleView: some View {
      HStack {
            VStack(alignment: .leading, spacing: 0) {
                  Text("Invoice Amount:")
                  Text("Money Settled:")
                  Divider().background(Color.red)
                  Spacer()
//                  Divider().background(Color.red)
                  Text("Money Owed:")
            }
//            .font(.system(size: 20))
//                                        .fontWeight(.bold)
                              .padding()
            VStack(alignment: .trailing, spacing: 0) {
                  Text(formatFunction(number: invoiceAmt))
                  Text(formatFunction(number: settledAmt))
                  Divider().background(Color.red)
                  Spacer()
                  Text(formatFunction(number: owedAmt))
            }
            .padding()
      }
      .font(.headline)
      .onAppear {
            invoiceAmt  =  Double(cart.totalInvoice) ?? 0
            owedAmt = invoiceAmt
     }
      .foregroundColor(.black)
      .frame(height: 150)
      .padding()
      .overlay(
              RoundedRectangle(cornerRadius: 16)
                  .stroke(Color.cyan, lineWidth: 4)
          )
}



 
            

      
      
      
      
      
//      VStack(alignment: .trailing, spacing: 5) {
//            VStack(alignment: .trailing, spacing: 0) {
//                  HStack {
//                         Text(formatFunction(number: invoiceAmt))
//                                    .font(.system(size: 20))
//                                    .fontWeight(.bold)
//                                    .padding()
//                  }
//                  ZStack (alignment: .lastTextBaseline ) {
//                        Text("Money Settled:")
//                              .fontWeight(.bold)
//                        Text(formatFunction(number: settledAmt))
//                              .fontWeight(.bold)
//            }
//                  .padding(.bottom)
//                  .font(.system(size: 20))
//
//            }
//            Divider().background(Color.red)
//      HStack{
//            Text("Money Owed:")
//             .font(.system(size: 20))
//             .fontWeight(.bold)
//             .padding()
//            Text(formatFunction(number: owedAmt))
//             .font(.system(size: 20))
//             .fontWeight(.bold)
//             .padding()
//      }
//      .background(.cyan)
//      }
//      .onAppear {
//            invoiceAmt  =  Double(cart.totalInvoice) ?? 0
//            owedAmt = invoiceAmt
//     }
//      .foregroundColor(.black)
//      .frame(height: 180)
//      .padding()
//      .overlay(
//              RoundedRectangle(cornerRadius: 16)
//                  .stroke(Color.cyan, lineWidth: 4)
//          )
//      }
      public func updateSettlementDisplay(amount: Double) {
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
              DispatchQueue.main.async {
                    self.invoiceAmt = model.invoiceAmount
              }
          }
      }

}

struct PayTabView_Previews: PreviewProvider {
    static var previews: some View {
          PayTabView()
            .environmentObject(CartManager())
    }
}
