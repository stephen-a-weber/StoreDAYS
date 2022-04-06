//
//  InvoiceModel.swift
//  StoreDAYS
//
//  Created by admin on 3/30/22.
//

import Foundation
class InvoiceModel: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case ID
        case Sum
        case User_ID
        case Shipping_ID
     
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
    @Published var Sum = 0.0
    @Published var User_ID = 0
    @Published var Shipping_ID = 0
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        Sum = try container.decode(Double.self, forKey: .Sum)
        User_ID = try container.decode(Int.self, forKey: .User_ID)
        Shipping_ID = try container.decode(Int.self, forKey: .Shipping_ID)
       
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(Sum, forKey: .Sum)
        try container.encode(User_ID, forKey: .User_ID)
        try container.encode(Shipping_ID, forKey: .Shipping_ID)
        
    }
}
