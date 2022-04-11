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
    let ID:String
    let CardNumber:String
    let CVC:String
    let Expiration:String
    let Name:String
    let User_ID:String
    let Address_ID:String
}
struct InvoiceModels: Hashable, Codable{
    let ID:String
    let Cost:String
    let User_ID:String
    let Shipping_ID:String
    let PaymentMethods_ID:String
    
}
struct OrdersModels: Hashable, Codable{
    let ID:String
    let Cost:String
    let Description:String
    let Invoice_ID:String
  
}
struct CatagoryModels: Hashable, Codable{
    let ID:String
    let title : String
}
struct ItemModels: Hashable, Codable{
    let ID:String
    let Name:String
    let Description:String
    let Cost:String
    let Catagory_ID:String
    let Img:String
    let Availability:String
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
