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
        let parameters="Email=\(email)&Password=\(password)Password!"
        var resquest = URLRequest(url: getuser!)
        resquest.httpMethod="POST"
        
        resquest.httpBody = parameters.data(using: String.Encoding.utf8)
        let getUsersTask = session.dataTask(with: resquest) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error
                print(error)
            } else if let data = data {
                // Handle HTTP request response
                print(String(data: data, encoding: .utf8)!)
                self.myData = String(data: data, encoding: .utf8)!
  
            } else {
       
            }
        }
        getUsersTask.resume()
 
        
    }
    
    func insertUserAWSService(userName: String, firstName: String, lastName: String, email: String, password: String)  {
        let session = URLSession.shared
        
        let getuser = URL(string:"http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Signup.php")
        let parameters="Email=\(email)&UserName=\(userName)&FirstName=\(firstName)&LastName=\(lastName)&Password=\(password)"
        print(parameters)
        //Email=Q@gmail.com&UserName=Q@gmail.com&FirstName=Q&LastName=Q&Password=qPassword!
        var resquest = URLRequest(url: getuser!)
        resquest.httpMethod="POST"
        
        resquest.httpBody = parameters.data(using: String.Encoding.utf8)
        let getUsersTask = session.dataTask(with: resquest) { (data, response, error) in
            
            if let error = error {
                print(error)
                // Handle HTTP request error
            } else if let data = data {
                // Handle HTTP request response
                print("Data send to AWS")
                print(String(data: data, encoding: .utf8)!)
                self.myData = String(data: data, encoding: .utf8)!
 
            } else {
                // Handle unexpected error
            }
        }
        
        getUsersTask.resume()
        
        
    }
}
