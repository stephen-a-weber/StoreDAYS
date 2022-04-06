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
    
    //// the data is from @StateObject data to keep a single instance in charge of the data of the app
    /// Here there is a toggle isPurchased which is used if the button below is pressed to signify if this
    /// Particular animal is going to be chosen and added to the Cart
    /// The name variable is a holder property as this page is called with some name .
    
    var body: some View {
        
        
        VStack {
        Image(puppyName)
            .resizable()
            .scaledToFit()
        //// In a vertical stack there is the called Image of the detail view of the row or image chosen.
            /// and a button with a toggle variable to add it to the cart
            /// The if statement allows only the one addition to the cart.
            /// 
            
            
            Button("Adopt this Puppy") { if !isPurchased {
        data.addToCart(item: puppyName)
        isPurchased.toggle()
            }}
    .frame(width: 155.0, height: 60.0)
            
            Spacer()
            Spacer()
                
            //    if you choose from this detail view
               // A notification is given to let you see some
               // reaction.
                
                
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
