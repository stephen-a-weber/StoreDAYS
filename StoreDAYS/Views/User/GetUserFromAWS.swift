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
        let session = URLSession.shared

        let getuser = URL(string:"http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/login.php")
        let paramas :[String:Any]=["Email":"malmsteadaa@gmail.com", "Password":"123Password!" ]
        let para="Email=malmsteadaa@gmail.com&Password=123Password!"
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
