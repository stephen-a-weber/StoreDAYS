//
//  UserData.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//
// we want a class of data to pass around through all the views (or some of them )
// we use the @Published in class and will make an instance in StoreDAYSApp as the Singleton @StateObject
// The files that need to refer to data can then grab this class through @environment
// And by making it conform to Codable we can pass it around through databases.
import Foundation
import SwiftUI

class UserData: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
        case address
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var name = "STOREDAYS!"
    @Published var address = ""
    
    
    
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        address = try container.decode(String.self, forKey: .address)
        
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(address, forKey: .address)
        
        
    }
    
    
    
    
}
