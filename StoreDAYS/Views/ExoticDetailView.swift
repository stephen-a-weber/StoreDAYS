//
//  ExoticDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct ExoticDetailView: View {
    @ObservedObject var data: Data
    @State var isPurchased = false
    var exoticName = "Bob"
    var body: some View {
        
        VStack {
        Image(exoticName)
            .resizable()
            .scaledToFit()
        
    Button("Adopt this Wonderful Animal") {
        data.addToCart(item: exoticName)
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
                Text("with this animal")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            
            
            
            
            
}
    }
     
}

struct ExoticDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExoticDetailView(data:Data(),exoticName: "animal1")
    }
}
