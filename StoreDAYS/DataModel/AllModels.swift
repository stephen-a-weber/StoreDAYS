//
//  AllModels.swift
//  StoreDAYS
//
//  Created by admin on 4/4/22.
//

import Foundation
struct UserModels: Hashable, Codable{
    let ID:String
    let UserName:String
    let FirstName:String
    let LastName:String
    let DateOfBirth:String
    let Password:String
    let Email:String
    let Admin:String
    
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
    let ID:String
    let ShippingType:String
    let Cost:String
    let ETA:String
    let User_ID:String
    let Status:String
    let Address_ID:String
    }
struct PaymentsModels: Hashable, Codable{
    let ID:Int
    let CardNumber:String
    let CVC:Int
    let Expiration:String
    let Name:String
    let User_ID:Int
    let Address_ID:Int
}
struct InvoiceModels: Hashable, Codable{
    let ID:Int
    let Sum:String
    let User_ID:Int
    let Shipping_ID:Int
    let PaymentMethods_ID:Int
    
}
struct OrdersModels: Hashable, Codable{
    let ID:Int
    let Cost:String
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
    let Cost:String
    let Catagory_ID:Int
    let Img:String
    let Availability:Int
}
struct LastInsert: Hashable, Codable{
    let LAST_INSERT_ID:Int
}
struct ReviewModels: Hashable, Codable{
    let ID:String
    let Body:String
    let User_ID:String
    let Rate:String
    let Items_ID:String
    let Catagory_ID:String
    
}
