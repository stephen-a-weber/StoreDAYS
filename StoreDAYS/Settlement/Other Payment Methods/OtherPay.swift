//
//  SetupCard.swift
//  StoreDAYS
//
//

import SwiftUI

struct OtherPay: View {
    
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    
      @State private var cardNumber: String = ""
      @State private var cardHolderName: String = ""
    @State private var expiration: String = ""
    @State private var cvv: String = ""
    
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
        }
    }
}

struct OtherPay_Previews: PreviewProvider {
    static var previews: some View {
        OtherPay()
    }
}
