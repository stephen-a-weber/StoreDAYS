//
//  OrderDetailModel.swift
//  StoreDAYS
//
//  Created by admin on 3/30/22.
//

import Foundation
class OrderDetailModel: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case ID
        case Items_ID
        case Order_ID
        case Quantity
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
	@Published var Items_ID = 0
    @Published var Order_ID = 0
    @Published var Quantity = 0
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        Items_ID = try container.decode(Int.self, forKey: .Items_ID)
        Order_ID = try container.decode(Int.self, forKey: .Order_ID)
        Quantity = try container.decode(Int.self, forKey: .Quantity)
        
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(Items_ID, forKey: .Items_ID)
        try container.encode(Order_ID, forKey: .Order_ID)
        try container.encode(Quantity, forKey: .Quantity)
        
    }
}
