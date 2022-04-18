//
//  PuppyDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct PuppyDetailView: View {
    @EnvironmentObject var data:Data
    @State var isPurchased = false
    var puppyName = "Bob"
    var puppyPrice="$34.00"
    var index :Int
    
    //// the data is from @StateObject data to keep a single instance in charge of the data of the app
    /// Here there is a toggle isPurchased which is used if the button below is pressed to signify if this
    /// Particular animal is going to be chosen and added to the Cart
    /// The name variable is a holder property as this page is called with some name .
    
    var body: some View {
        
        
        VStack {
        Image(data.puppyViewOrders[index].pictureName)
            .resizable()
            .scaledToFit()
        //// In a vertical stack there is the called Image of the detail view of the row or image chosen.
            /// and a button with a toggle variable to add it to the cart
            /// The if statement allows only the one addition to the cart.
            /// 
            
           Text("\(data.puppyViewOrders[index].price)")
            Button("Adopt this Puppy") { if !isPurchased {
                data.addToCart(item: data.puppyViewOrders[index])
        isPurchased.toggle()
            }}
            .frame(width: 155.0, height: 60.0)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            .shadow(radius: /*@START_MENU_TOKEN@*/18/*@END_MENU_TOKEN@*/)
            .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
            .hoverEffect(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.568, saturation: 0.107, brightness: 0.926)/*@END_MENU_TOKEN@*/)
            
            
            Spacer()
            Text("Born with the name: \(data.puppyViewOrders[index].name)")
                .font(.title)
                .fontWeight(.bold)
                .shadow(color:.blue,radius:6)
            Text(data.puppyViewOrders[index].description)
                .font(.title2)
                .fontWeight(.heavy)
                .padding(.all)
                .shadow(color:.blue,radius:6)
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
        PuppyDetailView(index: 0)
            .environmentObject(Data())
    }
}
