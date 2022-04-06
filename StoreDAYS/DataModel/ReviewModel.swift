//
//  ReviewModel.swift
//  StoreDAYS
//
//  Created by admin on 3/30/22.
//

import Foundation
class ReviewModel: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case ID
        case Body
        case User_ID
        case Rate
        case Items_ID
        case Catagory_ID
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
    @Published var Body = ""
    @Published var User_ID = 0
    @Published var Rate = 0
    @Published var Items_ID = 0
    @Published var Catagory_ID = 0
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        Body = try container.decode(String.self, forKey: .Body)
        User_ID = try container.decode(Int.self, forKey: .User_ID)
        Rate = try container.decode(Int.self, forKey: .Rate)
        Items_ID = try container.decode(Int.self, forKey: .Items_ID)
        Catagory_ID = try container.decode(Int.self, forKey: .Catagory_ID)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(Body, forKey: .Body)
        try container.encode(User_ID, forKey: .User_ID)
        try container.encode(Items_ID, forKey: .Items_ID)
        try container.encode(Catagory_ID, forKey: .Catagory_ID)
        
    }
}
