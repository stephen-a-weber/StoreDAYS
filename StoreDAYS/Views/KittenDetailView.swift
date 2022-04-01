//
//  KittenDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//


import SwiftUI

struct KittenDetailView: View {
    @ObservedObject var data : Data
    var kittenName = "Bob"
    @State var isPurchased = false
    var body: some View {
        
        VStack {
        Image(kittenName)
            .resizable()
            .scaledToFit()
       //Note multiple presses toggles item on and off but keeps adding another to cart.
    Button("Adopt this Kitten") {
        data.addToCart(item: kittenName)
        isPurchased.toggle()
    }
    .frame(width: 155.0, height: 60.0)
            Spacer()
            Spacer()
            if isPurchased {
                Text("Adding to Cart")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .background(.yellow)
                Text("You will be very happy")
                    .multilineTextAlignment(.center)
                Text("with this kitten")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
            Spacer()
}
        
    }

    
}
    
struct KittenDetailView_Previews: PreviewProvider {
    static var previews: some View {
        KittenDetailView(data: Data(), kittenName:"kitten1")
    }
}
