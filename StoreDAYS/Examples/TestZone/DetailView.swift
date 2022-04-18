//
//  DetailView.swift
//  StoreDAYS
//
//  Created by admin on 4/6/22.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var ItemedContainer : TheItemContainer = TheItemContainer(Item: ItemModels(ID: 2, Name: "demo", Description: "", Cost: 0.0, Catagory_ID: 0, Img: "", Availability: 1, Longitude: 0.0, Latitude: 0.0))
    @ObservedObject var data: Data
    @State var isPurchased = false
    
    //// the data is from @StateObject data to keep a single instance incharge of the data of the app
    /// Here there is a toggle isPurchased which is used if the button below is pressed to signify if this
    /// Particular animal is going to be chosen and added to the Cart
    /// The name variable is a holder property as this page is called with some name .
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string:ItemedContainer.Item.Img)) { image in
                                                               image.resizable()
                                                           } placeholder: {
                                                               Color.red
                                                           }
                                                           .frame(width: 128, height: 128)
                                                           .clipShape(RoundedRectangle(cornerRadius: 25))
            //// In a vertical stack there is the called Image of the detail view of the row or image chosen.
                /// and a button with a toggle variable to add it to the cart
                /// The if statement allows only the one addition to the cart.
                ///
               
            
            
            Button("Adopt this Kitten"){
                isPurchased=true
                data.addtoItemedCart(Item: ItemedContainer)         }
            }
    .frame(width: 155.0, height: 60.0)
          
            
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
                Text("with this kitten")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
            }
        
}
        
    }



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(data:Data())
    }
}

