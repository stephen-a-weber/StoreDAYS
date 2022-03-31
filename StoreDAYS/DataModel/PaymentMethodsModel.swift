//
//  PaymentMethods.swift
//  StoreDAYS
//
//  Created by admin on 3/30/22.
//

import Foundation
class PaymentMethodsModel: ObservableObject, Codable{
    enum CodingKeys: CodingKey {
        case ID
        case CardNumber
        case CVC
        case Expiration
        case Name
        case User_ID
        case Address_ID
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
    @Published var CardNumber = 0
    @Published var CVC = 0
    @Published var Expiration = ""
    @Published var Name = ""
    @Published var User_ID = 0
    @Published var Address_ID = 0
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        CardNumber = try container.decode(Int.self, forKey: .CardNumber)
        CVC = try container.decode(Int.self, forKey: .CardNumber)
        Expiration = try container.decode(String.self, forKey: .Expiration)
        User_ID = try container.decode(Int.self, forKey: .User_ID)
        Address_ID = try container.decode(Int.self, forKey: .Address_ID)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(CardNumber, forKey: .CardNumber)
        try container.encode(CVC, forKey: .CVC)
        try container.encode(Expiration, forKey: .Expiration)
        try container.encode(Name, forKey: .Name)
        try container.encode(User_ID, forKey: .User_ID)
        try container.encode(Address_ID, forKey: .Address_ID)
        
    }
}
