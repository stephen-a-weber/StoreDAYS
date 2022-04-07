//
//  Containers.swift
//  StoreDAYS
//
//  Created by admin on 4/6/22.
//

import Foundation
import SwiftUI


class ItemContainer:ObservableObject, Identifiable ,Equatable {
    static func == (lhs: ItemContainer, rhs: ItemContainer) -> Bool {
        return lhs.ID==rhs.ID
    }
    init(){
        }
    init(Item:ItemModels){
        self.Item=Item
        convert()
    }
     func convert(){
         self.ID=Int(Item.ID)!
        Name=Item.Name
        Description=Item.Description
        Cost=Double(Item.Cost)!
        Catagory_ID=Int(Item.Catagory_ID)!
        Img=Item.Name
        Availability=Int(Item.Availability)!
    }
    func addtoCart(items:ItemContainer){
        if !Store.TheStore.Cart.order.contains(items){
            Store.TheStore.Cart.order.append(items)}
        for i in Store.TheStore.Cart.order{
            print(i.Name)
        }
       
    }
    init(Item:ItemModels,Reviews:[ReviewModels]){
        self.Item=Item
        self.Review=Reviews
    }
    @Published var order = [ItemContainer]()
    @Published var Review:[ReviewModels]=[ReviewModels]()
    @Published var Item: ItemModels = ItemModels(ID: "", Name: "", Description: "", Cost: "", Catagory_ID: "", Img: "", Availability: "")
    @Published var id=UUID()
    @Published var ID=0
    @Published var Name=""
    @Published var Description=""
    @Published var Cost=0.0
    @Published var Catagory_ID=0
    @Published var Img:String=""
    @Published var Availability=0
    
}
//
//class invoiceContainer{
//    init(Invoice:InvoiceModels){
//        self.Invoice=Invoice
//        self.orders=[OrdersModels]()
//    }
//    init(Invoice:InvoiceModels,Orders:[OrdersModels]){
//        self.Invoice=Invoice
//        self.orders=Orders
//    }
//}
