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
    func getUseAWSService(email: String, password: String) -> String {
        let session = URLSession.shared
        
        let getuser = URL(string:"http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/login.php")
        let parameters="Email=\(email)&Password=\(password)Password!"
        var resquest = URLRequest(url: getuser!)
        resquest.httpMethod="POST"
        
        resquest.httpBody = parameters.data(using: String.Encoding.utf8)
        let getUsersTask = session.dataTask(with: resquest) { (data, response, error) in
            
            if let error = error {
                // Handle HTTP request error
            } else if let data = data {
                // Handle HTTP request response
              //  print(String(data: data, encoding: .utf8)!)
                self.myData = String(data: data, encoding: .utf8)!
               // print("self.myEmail",self.myData)
               // myData = data as Foundation.Data
               // print(String(describing: type(of: data)) )
            } else {
                // Handle unexpected error
            }
        }
        
        getUsersTask.resume()
        return myData
        
    }
    
}
