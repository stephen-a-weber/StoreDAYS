//
//  ItemsModel.swift
//  StoreDAYS
//
//  Created by admin on 3/30/22.
//

import Foundation
class ItemsModel: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case ID
        case Name
        case Description
        case Cost
        case Catagory_ID
        case Stock
     
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
    @Published var Name = ""
    @Published var Description = ""
    @Published var Cost = 0.0
    @Published var Catagory_ID = 0
    @Published var Stock = 0
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        Name = try container.decode(String.self, forKey: .Name)
        Description = try container.decode(String.self, forKey: .Description)
        Cost = try container.decode(Double.self, forKey: .Cost)
        Catagory_ID = try container.decode(Int.self, forKey: .Catagory_ID)
        Stock = try container.decode(Int.self, forKey: .Stock)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(Name, forKey: .Name)
        try container.encode(Description, forKey: .Description)
        try container.encode(Cost, forKey: .Cost)
        try container.encode(Catagory_ID, forKey: .Catagory_ID)
        try container.encode(Stock, forKey: .Stock)
        
    }
}
