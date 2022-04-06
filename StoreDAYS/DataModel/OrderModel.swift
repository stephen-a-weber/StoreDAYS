//
//  OrderModel.swift
//  StoreDAYS
//
//  Created by admin on 3/30/22.
//

import Foundation
class OrderModel: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case ID
        case Cost
        case Description
        case Invoice_ID
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
    @Published var Cost = 0.0
    @Published var Description = ""
    @Published var Invoce_ID = 0
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        Cost = try container.decode(Double.self, forKey: .Cost)
        Description = try container.decode(String.self, forKey: .Description)
        Invoce_ID = try container.decode(Int.self, forKey: .Invoice_ID)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(Cost, forKey: .Cost)
        try container.encode(Description, forKey: .Description)
        try container.encode(Invoce_ID, forKey: .Invoice_ID)
        
    }
}
