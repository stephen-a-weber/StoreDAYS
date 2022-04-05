//
//  GetUser.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 3/31/22.
//

import Foundation
// Create a URLRequest for an API endpoint
class ManageUserFromAWS{
    
    // var myData: Data
    var myData: String=""
    func getUserAWSService(email: String, password: String)   {
        let session = URLSession.shared
        let getuser = URL(string:"http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/login.php")
        //    let paramas :[String:Any]=["Email":"malmsteadaa@gmail.com", "Password":"123Password!" ]
        let para="Email=\(email)&Password=\(password)Password!"
        var resquest = URLRequest(url: getuser!)
        resquest.httpMethod="POST"
        
        resquest.httpBody = para.data(using: String.Encoding.utf8)
        let getUsersTask = session.dataTask(with: resquest) { (data, response, error) in
            
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
    
    func insertUserAWSService(userName: String, firstName: String, lastName: String, email: String, password: String)  {
        let session = URLSession.shared
        let getuser = URL(string:"http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Signup.php")
        
        let para="Email=\(email)&UserName=\(userName)&FirstName=\(firstName)&LastName=\(lastName)&Password=\(password)Password!"
        var resquest = URLRequest(url: getuser!)
        resquest.httpMethod="POST"
        
        resquest.httpBody = para.data(using: String.Encoding.utf8)
        let getUsersTask = session.dataTask(with: resquest) { (data, response, error) in
            
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
