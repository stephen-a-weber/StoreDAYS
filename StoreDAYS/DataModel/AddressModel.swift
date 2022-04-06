//
//  AddressModel.swift
//  StoreDAYS
//
//  Created by admin on 3/30/22.
//

import Foundation
class AddressModel: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case ID
        case Street
        case City
        case User_ID
        case State
        case Zip
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
    @Published var Street = ""
    @Published var City = ""
    @Published var User_ID = 0
    @Published var State = ""
    @Published var Zip = ""
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        Street = try container.decode(String.self, forKey: .Street)
        City = try container.decode(String.self, forKey: .City)
        User_ID = try container.decode(Int.self, forKey:.User_ID)
        State = try container.decode(String.self, forKey: .State)
        Zip = try container.decode(String.self, forKey: .Zip)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(Street, forKey: .Street)
        try container.encode(City, forKey: .City)
        try container.encode(User_ID, forKey: .User_ID)
        try container.encode(State, forKey: .State)
        try container.encode(Zip, forKey: .Zip)
        
    }
}
