//
//  ExoticDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct ExoticDetailView: View {
    @EnvironmentObject var data:Data
    @State var isPurchased = false
    var exoticName = "Bob"
    var exoticPrice="$45.00"
    var index = 0
    //// the data is from @StateObject data to keep a single instance in charge of the data of the app
    /// Here there is a toggle isPurchased which is used if the button below is pressed to signify if this
    /// Particular animal is going to be chosen and added to the Cart
    /// The name variable is a holder property as this page is called with some name .
    
    
    var body: some View {
        
        VStack {
        Image(data.exoticViewOrders[index].pictureName)
            .resizable()
            .scaledToFit()
        
            //// In a vertical stack there is the called Image of the detail view of the row or image chosen.
                /// and a button with a toggle variable to add it to the cart
                /// The if statement allows only the one addition to the cart.
                ///
               
            
           Text("\(data.exoticViewOrders[index].price)")
            Button("Adopt this Wonderful Animal") { if !isPurchased {
                data.addToCart(item: data.exoticViewOrders[index])
        isPurchased.toggle()
            }}
    .frame(width: 155.0, height: 60.0)
            Spacer()
            Text("Born with the name: \(data.exoticViewOrders[index].name)")
            Text(data.exoticViewOrders[index].description)
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
        ExoticDetailView()
            .environmentObject(Data())
    }
}
