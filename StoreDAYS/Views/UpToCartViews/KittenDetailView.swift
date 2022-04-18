//
//  KittenDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//


import SwiftUI

struct KittenDetailView: View {
    @EnvironmentObject var data:Data
    var kittenName = "Bob"
    var kittenPrice = "$19.00"
    var index = 0
    @State var isPurchased = false
    
    //// the data is from @StateObject data to keep a single instance incharge of the data of the app
    /// Here there is a toggle isPurchased which is used if the button below is pressed to signify if this
    /// Particular animal is going to be chosen and added to the Cart
    /// The name variable is a holder property as this page is called with some name .
    
    var body: some View {
        
        VStack {
            Image(data.kittenViewOrders[index].pictureName)
            .resizable()
            .scaledToFit()
       
            //// In a vertical stack there is the called Image of the detail view of the row or image chosen.
                /// and a button with a toggle variable to add it to the cart
                /// The if statement allows only the one addition to the cart.
                ///
               
            
            Text("\(data.kittenViewOrders[index].price)")
            Button("Adopt this Kitten") { if !isPurchased {
                data.addToCart(item: data.kittenViewOrders[index])
        isPurchased.toggle()
            }}
            .frame(width: 155.0, height: 60.0)
            .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
            .shadow(radius: /*@START_MENU_TOKEN@*/18/*@END_MENU_TOKEN@*/)
            .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
            .hoverEffect(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.568, saturation: 0.107, brightness: 0.926)/*@END_MENU_TOKEN@*/)
            Spacer()
            Text("Born with the name: \(data.kittenViewOrders[index].name)")
                .font(.title)
                .fontWeight(.bold)
                .shadow(color:.blue,radius:6)
                .padding(.all)
            Text(data.kittenViewOrders[index].description)
                .font(.title)
                .fontWeight(.bold)
                .shadow(color:.blue,radius:6)
                .padding(.all)
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
        KittenDetailView(index:0)
            .environmentObject(Data())
    }
}
