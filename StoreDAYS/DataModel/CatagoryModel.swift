//
//  CatagoryModel.swift
//  StoreDAYS
//
//  Created by admin on 3/30/22.
//

import Foundation
class CatagoryModel: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case ID
        case Title
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
    @Published var Title = ""
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        Title = try container.decode(String.self, forKey: .Title)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(Title, forKey: .Title)
        
    }
}
