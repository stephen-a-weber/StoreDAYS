//
//  SetupCard.swift
//  StoreDAYS
//
//

import SwiftUI

struct OtherPay: View {
    @Environment(\.presentationMode) var presentationMode
    @State  var degrees: Double = 0
    @State  var flipped: Bool = false
    @State var ID = 0
    @State var User_ID=0
    @State var UseEditFlag=true
      @State  var cardNumber: String = ""
      @State  var cardHolderName: String = ""
    @State  var expiration: String = ""
    @State  var cvv: String = ""
    
    var body: some View {
        VStack {
            PaymentCard {
                VStack {
                    Group {
                        if flipped {
                            PaymentCardBack(cvv: cvv)
                        } else {
                            PaymentCardFront(name: cardHolderName, expiration: expiration)
                        }
                    }
                }.rotation3DEffect(
                    .degrees(degrees),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            }
            .onTapGesture {
                withAnimation {
                    degrees += 180
                    flipped.toggle()
                }
            }
            
              TextField("Card Number", text: $cardNumber)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding([.top,.leading,.trailing])
                  .frame(height:25)
              TextField("Name", text: $cardHolderName)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .padding([.top,.leading,.trailing])
                  .frame(height:25)
            TextField("Expiration", text: $expiration)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
                .frame(height:25)
            TextField("CVV", text: $cvv) { (editingChanged) in
                withAnimation {
                    degrees += 180
                    flipped.toggle()
                }
            } onCommit: {}
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
                .frame(height:25)
            if !UseEditFlag{
                if ID==0{
                    Button {
                let model=PaymentsModels(ID: ID, CardNumber: cardNumber, CVC: Int(cvv) ?? 0, Expiration: expiration, Name: cardHolderName, User_ID: User_ID, Address_ID: 2)
                        POSTNEWPaymentMethods(Model: model)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Make")
                    }

                }else{
                    Button {
                        let model=PaymentsModels(ID: ID, CardNumber: cardNumber, CVC: Int(cvv)!, Expiration: expiration, Name: cardHolderName, User_ID: User_ID, Address_ID: 2)
                        POSTUpdatePaymentMethods(Model: model)
                        presentationMode.wrappedValue.dismiss()                    } label: {
                        Text("Update")
                    }
                    
                }
            }else{
                Button {
                    print("")
                } label: {
                    Text("Continue")
                }
                
            }
        }
    }
}

struct OtherPay_Previews: PreviewProvider {
    static var previews: some View {
        OtherPay()
    }
}
