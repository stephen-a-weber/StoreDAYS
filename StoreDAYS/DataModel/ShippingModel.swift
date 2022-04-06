//
//  ShippingModel.swift
//  StoreDAYS
//
//  Created by admin on 3/30/22.
//

import Foundation
class ShippingModel: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case ID
        case type
        case Cost
        case ETA
        case User_ID
        case Status
        case Address_ID
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
    @Published var type = ""
    @Published var Cost = 0.0
    @Published var User_ID = 0
    @Published var Status = ""
    @Published var Address_ID = 0
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        type = try container.decode(String.self, forKey: .type)
        Cost = try container.decode(Double.self, forKey: .Cost)
        User_ID = try container.decode(Int.self, forKey: .User_ID)
        Status = try container.decode(String.self, forKey: .Status)
        Address_ID = try container.decode(Int.self, forKey: .Address_ID)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(type, forKey: .type)
        try container.encode(Cost, forKey: .Cost)
        try container.encode(User_ID, forKey: .User_ID)
        try container.encode(Status, forKey: .Status)
        try container.encode(Address_ID, forKey: .Address_ID)
        
    }
}
