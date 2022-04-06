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
        case ID
        case UserName
        case FirstName
        case LastName
        case DateOfBirth
        case Password
        case Email
    }
    
    //example data using example enum instead of stringy calls
    
    @Published var ID = 0
    @Published var UserName = "davisgon@gmail.com"
    @Published var FirstName = "David"
    @Published var LastName = "Gonzalez"
    @Published var DateOfBirth = "06/25/1000"
    @Published var Password = "123"
    @Published var Email = "davisgon@gmail.com"
    
    init() {}
    // These are the required functions to conform to  Codable Protocol
    // Both encode and decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ID = try container.decode(Int.self, forKey: .ID)
        UserName = try container.decode(String.self, forKey: .UserName)
        FirstName = try container.decode(String.self, forKey: .FirstName)
        LastName = try container.decode(String.self, forKey: .LastName)
        DateOfBirth = try container.decode(String.self, forKey: .DateOfBirth)
        Password = try container.decode(String.self, forKey: .Password)
        Email = try container.decode(String.self, forKey: .Email)
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(ID, forKey: .ID)
        try container.encode(UserName, forKey: .UserName)
        try container.encode(FirstName, forKey: .FirstName)
        try container.encode(LastName, forKey: .LastName)
        try container.encode(DateOfBirth, forKey: .DateOfBirth)
        try container.encode(Password, forKey: .Password)
        try container.encode(Email, forKey: .Email)
        
    }
    
    
    
    
}
