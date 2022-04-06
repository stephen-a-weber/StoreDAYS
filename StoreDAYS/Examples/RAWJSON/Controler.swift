//
//  Controler.swift
//  StoreDAYS
//
//  Created by admin on 4/1/22.
//

import Foundation
struct User: Hashable, Codable{
    let Email:String
    let Password:String
}
func postMethod() {
        /*
         The following commented code is about when you want to make a POST call with parameters, like consumer key, consumer secret e.t.c
         */
        
//        guard let components = URLComponents(string: "MY_URL") else {
//            print("Error: cannot create URLCompontents")
//            return
//        }
//        components.queryItems = [
//            URLQueryItem(name: "consumer_key", value: "MY_CONSUMER_KEY"),
//            URLQueryItem(name: "consumer_secret", value: "MY_CONSUMER_SECRET")
//        ]
//        guard let url = components.url else {
//            print("Error: cannot create URL")
//            return
//        }
        guard let url = URL(string: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/login.php") else {
            print("Error: cannot create URL")
            return
        }
        
        // Create model
        struct UploadData: Codable {
            let Email: String
            let Password: String
        }
        
        // Add data to the model
        let uploadDataModel = UploadData(Email: "malmsteadaa@gmail.com", Password: "123Password!")
        
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.httpBody = jsonData
        // If you are using Basic Authentication uncomment the follow line and add your base64 string
//        request.setValue("Basic MY_BASIC_AUTH_STRING", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                print(String(data:data, encoding: .utf8))
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    func getMethod() {
        /*
         The following commented code is about when you want to make a GET call with parameters, like consumer key, consumer secret e.t.c
         */
        
//        guard let components = URLComponents(string: "MY_URL") else {
//            print("Error: cannot create URLCompontents")
//            return
//        }
//        components.queryItems = [
//            URLQueryItem(name: "consumer_key", value: "MY_CONSUMER_KEY"),
//            URLQueryItem(name: "consumer_secret", value: "MY_CONSUMER_SECRET")
//        ]
//        guard let url = components.url else {
//            print("Error: cannot create URL")
//            return
//        }
        guard let url = URL(string: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/login.php") else {
            print("Error: cannot create URL")
            return
        }
        var prettyPrintedJson = [User]()
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // If you are using Basic Authentication uncomment the follow line and add your base64 string
//        request.setValue("Basic MY_BASIC_AUTH_STRING", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                print(error!)
                return
            }
            do {
                if let data = data{print(String(data: data, encoding: .utf8)!)}
                let users = try JSONDecoder().decode([User].self, from: data!)
                
                
                
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            print(String(data:data!, encoding: .utf8))

        print(prettyPrintedJson)
        }.resume()
    }
    
    func putMethod() {
        /*
         The following commented code is about when you want to make a PUT call with parameters, like consumer key, consumer secret e.t.c
         */
        
//        guard let components = URLComponents(string: "MY_URL") else {
//            print("Error: cannot create URLCompontents")
//            return
//        }
//        components.queryItems = [
//            URLQueryItem(name: "consumer_key", value: "MY_CONSUMER_KEY"),
//            URLQueryItem(name: "consumer_secret", value: "MY_CONSUMER_SECRET")
//        ]
//        guard let url = components.url else {
//            print("Error: cannot create URL")
//            return
//        }
        guard let url = URL(string: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/login.php") else {
            print("Error: cannot create URL")
            return
        }
        
        // Create model
        struct UploadData: Codable {
            let name: String
            let job: String
        }
        
        // Add data to the model
        let uploadDataModel = UploadData(name: "Nicole", job: "iOS Developer")
        
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        // If you are using Basic Authentication uncomment the follow line and add your base64 string
//        request.setValue("Basic MY_BASIC_AUTH_STRING", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling PUT")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                print(String(data:data, encoding: .utf8))

            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    func deleteMethod() {
        /*
         The following commented code is about when you want to make a DELETE call with parameters, like consumer key, consumer secret e.t.c
         */
        
//        guard let components = URLComponents(string: "MY_URL") else {
//            print("Error: cannot create URLCompontents")
//            return
//        }
//        components.queryItems = [
//            URLQueryItem(name: "consumer_key", value: "MY_CONSUMER_KEY"),
//            URLQueryItem(name: "consumer_secret", value: "MY_CONSUMER_SECRET")
//        ]
//        guard let url = components.url else {
//            print("Error: cannot create URL")
//            return
//        }
        guard let url = URL(string: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/login.php") else {
            print("Error: cannot create URL")
            return
        }
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        // If you are using Basic Authentication uncomment the follow line and add your base64 string
//        request.setValue("Basic MY_BASIC_AUTH_STRING", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling DELETE")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                print(String(data:data, encoding: .utf8))

            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }