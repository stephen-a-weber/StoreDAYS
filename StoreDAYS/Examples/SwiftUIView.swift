//
//  SwiftUIView.swift
//  StoreDAYS
//
//  Created by admin on 4/7/22.
//

import SwiftUI

struct SwiftUIView: View {

    var body: some View {
        Button("CheckOut") {
            let i=ItemModels(ID: 1, Name: "Snow", Description: "White/Black", Cost: 20.00, Catagory_ID: 1, Img: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten1.jpeg", Availability: 1, Longitude: 0.0, Latitude: 0.0)
            TheItems.append(ItemContainer(Item: i))
            TheItems.append(ItemContainer(Item: i))
            checkout(Shipment: 1, Payment: 1, Items: TheItems, User_ID: 2)
        }
    
}
}
var TheItems=[ItemContainer]()


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
