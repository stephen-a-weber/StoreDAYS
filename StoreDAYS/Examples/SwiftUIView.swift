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
            checkout(Shipment: 1, Payment: 1, Items: TheItems, User_ID: 2)
        }
    
}
}
var TheItems=[ItemContainer]()

func checkout(Shipment:Int,Payment:Int,Items:[ItemContainer],User_ID:Int){
    var sum=0.0
    var i=ItemModels(ID: "1", Name: "Snow", Description: "White/Black", Cost: "20.00", Catagory_ID: "1", Img: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten1.jpeg", Availability: "1")
    TheItems.append(ItemContainer(Item: i))
    TheItems.append(ItemContainer(Item: i))
    for Item in Items{
        sum = Item.Cost+sum
    }
    POSTNewInvoice(Cost: sum, Shipping_ID: Shipment, User_ID: User_ID, OrderedItems: Items, PaymentMethods_ID: Payment)
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
