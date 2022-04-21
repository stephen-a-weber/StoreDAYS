//
//  AllModels.swift
//  StoreDAYS
//
//  Created by admin on 4/4/22.
//

import Foundation
struct UserModels: Hashable, Codable{
    var ID:Int
    var UserName:String
    var FirstName:String
    var LastName:String
    var DateOfBirth:String
    var Password:String
    var Email:String
    var Admin:Int
    
}
struct IDModel: Hashable, Codable{
var ID:Int
}
struct AddressModels: Hashable, Codable{
    var ID:Int
    var Street:String
    var City:String
    var User_ID:Int
    var State:String
    var Zip:String
    }
struct ShippingModels: Hashable, Codable{
    var ID:Int
    var ShippingType:String
    var Cost:Double
    var ETA:String
    var User_ID:Int
    var Status:String
    var Address_ID:Int
    }
struct PaymentsModels: Hashable, Codable{
    var ID:Int
    var CardNumber:String
    var CVC:String
    var Expiration:String
    var Name:String
    var User_ID:Int
    var Address_ID:Int
}
struct InvoiceModels: Hashable, Codable{
    var ID:Int
    var Cost:Double
    var User_ID:Int
    var Shipping_ID:Int
    var PaymentMethods_ID:Int
    
}
struct OrdersModels: Hashable, Codable{
    var ID:Int
    var Cost:Double
    var Description:String
    var Invoice_ID:Int
  
}
struct CatagoryModels: Hashable, Codable{
    var ID:String
    var title : String
}
struct ItemModels: Hashable, Codable{
    var ID:Int
    var Name:String
    var Description:String
    var Cost:Double
    var Catagory_ID:Int
    var Img:String
    var Availability:Int
    var Longitude:Double
    var Latitude:Double

}
struct LastInsert: Hashable, Codable{
    var LAST_INSERT_ID:Int
}
struct ReviewModels: Hashable, Codable{
    var ID:Int
    var Body:String
    var User_ID:Int
    var Rate:Int
    var Items_ID:Int
    var Catagory_ID:Int
    
}
struct Invoices:Hashable{
    var SelfInvoice:InvoiceModels
    var Order:[Orders]
}
struct Orders:Hashable{
    var SelfOrder:OrdersModels
    var Items:ItemModels
}
