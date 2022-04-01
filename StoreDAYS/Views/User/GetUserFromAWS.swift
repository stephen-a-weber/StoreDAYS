//
//  GetUser.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 3/31/22.
//

import Foundation
// Create a URLRequest for an API endpoint
class GetUserFromAWS{
    
    
    func read(){
        
        let usersURL = URL(string: "https://or5aucdxxc.execute-api.us-east-1.amazonaws.com/v1/users")!
//        let usersURL = URL(string: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/login.php?Email=DavidG@gmail.com&Password=123Password!")!
        var createUserRequest = URLRequest(url: usersURL)
        
        // serialize HTTP Body data as JSON
        let body = ["username": "testuser2", "password": "testuser22password"]
        let bodyData = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        //change URLRequest to POST
        createUserRequest.httpMethod = "POST"
        createUserRequest.httpBody = bodyData
        
        // Create the HTTP request
        let session = URLSession.shared
        let createUserTask = session.dataTask(with: createUserRequest) { (data, response, error) in
            if let error = error {
                // Handle HTTP request error
            } else if let data = data {
                // Handle HTTP request response
                print(String(data: data, encoding: .utf8)!)
            } else {
                // Handle unexpected error
            }
        }
        //createUserTask.resume()
        var getUserRequest = URLRequest(url: usersURL)
        
        let getUsersTask = session.dataTask(with: getUserRequest) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error
            } else if let data = data {
                // Handle HTTP request response
                print(String(data: data, encoding: .utf8)!)
            } else {
                // Handle unexpected error
            }
        }
        
        getUsersTask.resume()
        
    }
}
