//
//  PuppyDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct PuppyDetailView: View {
    @ObservedObject var data: Data
    @State var isPurchased = false
    var puppyName = "Bob"
    var body: some View {
        
        
        VStack {
        Image(puppyName)
            .resizable()
            .scaledToFit()
        
    Button("Adopt this Puppy") {
        data.addToCart(item: puppyName)
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
                Text("with this puppy")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            
            
            
            
}
        }
    
}

struct PuppyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PuppyDetailView(data: Data(),puppyName: "puppy1")
    }
}
