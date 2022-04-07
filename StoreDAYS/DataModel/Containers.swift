//
//  Containers.swift
//  StoreDAYS
//
//  Created by admin on 4/6/22.
//

import Foundation

struct ItemContainer:Hashable{
    static func == (lhs: ItemContainer, rhs: ItemContainer) -> Bool {
        return lhs.ID==rhs.ID
    }
    
    init(Item:ItemModels){
        self.Item=Item
        convert()
    }
    mutating func convert(){
        ID=Int(Item.ID)!
        Name=Item.Name
        Description=Item.Description
        Cost=Double(Item.Cost)!
        Catagory_ID=Int(Item.Catagory_ID)!
        Img=Item.Name
        Availability=Int(Item.Availability)!
    }
    func addtoCart(){
        Store.TheStore.Cart.append(self)
    }
    init(Item:ItemModels,Reviews:[ReviewModels]){
        self.Item=Item
        self.Review=Reviews
    }
    var Review:[ReviewModels]=[ReviewModels]()
    var Item: ItemModels
    var id=UUID()
    var ID=0
    var Name=""
    var Description=""
    var Cost=0.0
    var Catagory_ID=0
    var Img:String=""
    var Availability=0
    
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
