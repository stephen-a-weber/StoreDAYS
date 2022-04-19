//
//  AllModels.swift
//  StoreDAYS
//
//  Created by admin on 4/4/22.
//

import Foundation
struct UserModels: Hashable, Codable{
    let ID:Int
    let UserName:String
    let FirstName:String
    let LastName:String
    let DateOfBirth:String
    let Password:String
    let Email:String
    let Admin:String
    
}
struct IDModel: Hashable, Codable{
let ID:Int
}
struct AddressModels: Hashable, Codable{
    let ID:Int
    let Street:String
    let City:String
    let User_ID:Int
    let State:String
    let Zip:String
    }
struct ShippingModels: Hashable, Codable{
    let ID:Int
    let ShippingType:String
    let Cost:Double
    let ETA:String
    let User_ID:Int
    let Status:String
    let Address_ID:Int
    }
struct PaymentsModels: Hashable, Codable{
    let ID:Int
    let CardNumber:String
    let CVC:String
    let Expiration:String
    let Name:String
    let User_ID:Int
    let Address_ID:Int
}
struct InvoiceModels: Hashable, Codable{
    let ID:Int
    let Cost:Double
    let User_ID:Int
    let Shipping_ID:Int
    let PaymentMethods_ID:Int
    
}
struct OrdersModels: Hashable, Codable{
    let ID:Int
    let Cost:Double
    let Description:String
    let Invoice_ID:Int
  
}
struct CatagoryModels: Hashable, Codable{
    let ID:String
    let title : String
}
struct ItemModels: Hashable, Codable{
    let ID:Int
    let Name:String
    let Description:String
    let Cost:Double
    let Catagory_ID:Int
    let Img:String
    let Availability:Int
    let Longitude:Double
    let Latitude:Double

}
struct LastInsert: Hashable, Codable{
    let LAST_INSERT_ID:Int
}
struct ReviewModels: Hashable, Codable{
    let ID:Int
    let Body:String
    let User_ID:Int
    let Rate:Int
    let Items_ID:Int
    let Catagory_ID:Int
    
}
struct Invoices:Hashable{
    var SelfInvoice:InvoiceModels
    var Order:[Orders]
}
struct Orders:Hashable{
    var SelfOrder:OrdersModels
    var Items:ItemModels
}
