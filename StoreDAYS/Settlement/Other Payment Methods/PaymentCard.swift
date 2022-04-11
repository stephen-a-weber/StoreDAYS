//
//  PaymentCard.swift
//  StoreDAYS
//
//

import SwiftUI

struct PaymentCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}


struct PaymentCardFront: View {
    
    let name: String
    let expiration: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.white)
            
                Spacer()
                
                Text("Debit")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
            
            }
            
            Spacer()
            
            Text("**** **** **** ****")
                .foregroundColor(Color.white)
                .font(.system(size: 21))
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    Text(name)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                Spacer()
                VStack {
                    Text("Valid Through")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    Text(expiration)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                
            }
         }.frame(width: 200, height: 120)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
    }
}


struct PaymentCardBack: View {
    
    let cvv:String
    
    var body: some View {
        VStack {
           
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding([.top])
            
            Spacer()
            
            HStack {
                
                Text(cvv)
                        .foregroundColor(Color.black)
                        .rotation3DEffect(
                        .degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                        .padding(5)
                        .frame(width: 100, height: 20)
                        .background(Color.white)
                Spacer()
            }.padding()
            
        }.frame(width: 200, height: 120)
        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        .cornerRadius(10)
    }
}


struct PaymentCard_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCard<PaymentCardFront>(content: { PaymentCardFront(name: "", expiration: "") })
    }
}
