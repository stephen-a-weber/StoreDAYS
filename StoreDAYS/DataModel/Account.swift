//
//  Account.swift
//  StoreDAYS
//
//  Created by admin on 4/5/22.
//

import Foundation
import CoreVideo
class account{
    static let initAccount=account()
    private init(){}
    @Published var User:UserModels=UserModels(ID: "", UserName: "", FirstName: "", LastName: "", DateOfBirth: "", Password: "", Email: "", Admin: "")
    let UpdateUser = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/UpdateUser.php"

    @Published var Address: [AddressModels] = [AddressModels]()
    @Published var Shipping:[ShippingModels] = [ShippingModels]()
    @Published var PaymentMethods:[PaymentsModels] = [PaymentsModels]()
    @Published var Invoice:[InvoiceModels]=[InvoiceModels]()
    @Published var orders:[OrdersModels]=[OrdersModels]()
    let AddressURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Address.php"
    let ShippingURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Shipping.php"
    let PaymentURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Payment.php"
    let InvoiceURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Invoice.php"
    let OrdersURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Orders.php"

    func login(Email:String,Password:String){
        
    }
    func login(User:UserModels){
        self.User=User
    }
    func updateUser(){
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="User=\(self.User.ID)"
        var request=URLRequest(url: URL(string: UpdateUser)!)
        request.httpMethod="POST"
        request.httpBody=paremeters.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
            print(String(data:data, encoding: String.Encoding.utf8) ?? "")
                   
                }
                task.resume()
    }
    func isUser()->Bool{
        return self.User.ID != ""
    }
    func GETDATA(){
        if isUser() {return}
        GETAddress()
        GETShipping()
        GETPaymentMethods()
        GETInvoice()
       // GETOrders()
    }
    func GETAddress(){
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="User=\(self.User.ID)"
        var request=URLRequest(url: URL(string: (AddressURL+paremeters))!)
        request.httpMethod="GET"
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
                    //convert to json
                    do{
                        let JsonData = try JSONDecoder().decode([AddressModels].self, from: data)
                        DispatchQueue.main.async {
                            self?.Address=JsonData
                        }
                    }catch{
                        print(error)
                    }
                }
                task.resume()
    }
    func GETShipping(){
        
            //creating REQUEST URL with parameters in http body and the method define
            let paremeters="User=\(self.User.ID)"
        var request=URLRequest(url: URL(string: (ShippingURL+paremeters))!)
        request.httpMethod="GET"
        // run network task
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
                    //convert to json
                    do{
                        let JsonData = try JSONDecoder().decode([ShippingModels].self, from: data)
                        DispatchQueue.main.async {
                            self?.Shipping=JsonData
                        }
                    }catch{
                        print(error)
                    }
                }
                task.resume()
    }
    func GETPaymentMethods()        {
        
            //creating REQUEST URL with parameters in http body and the method define
            let paremeters="User=\(self.User.ID)"
        var request=URLRequest(url: URL(string: (PaymentURL+paremeters))!)
        request.httpMethod="GET"
        // run network task
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                        guard let data = data, error == nil else{
                            print("error")
                            return
                        }
                        //convert to json
                        do{
                            let JsonData = try JSONDecoder().decode([PaymentsModels].self, from: data)
                            DispatchQueue.main.async {
                                self?.PaymentMethods=JsonData
                            }
                        }catch{
                            print(error)
                        }
                    }
                    task.resume()
    }
    func GETInvoice(){
        
            //creating REQUEST URL with parameters in http body and the method define
            let paremeters="User=\(self.User.ID)"
        var request=URLRequest(url: URL(string: (InvoiceURL+paremeters))!)
            request.httpMethod="GET"
        // run network task
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
                    //convert to json
                    do{
                        let JsonData = try JSONDecoder().decode([InvoiceModels].self, from: data)
                        DispatchQueue.main.async {
                            self?.Invoice=JsonData
                        }
                    }catch{
                        print(error)
                    }
                }
                task.resume()
    }
    func GETOrders(){
        
            //creating REQUEST URL with parameters in http body and the method define
            let paremeters="User=\(self.User.ID)"
        var request=URLRequest(url: URL(string: (AddressURL+paremeters))!)
            request.httpMethod="GET"
        // run network task
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
                    //convert to json
                    do{
                        let JsonData = try JSONDecoder().decode([OrdersModels].self, from: data)
                        DispatchQueue.main.async {
                            self?.orders=JsonData
                        }
                    }catch{
                        print(error)
                    }
                }
                task.resume()
    }
    func POSTDATA(){
        POSTAddress()
        POSTShipping()
        POSTPaymentMethods()
        POSTInvoice()
        POSTOrders()
    }
    
    func POSTAddress(){
        for Model in Address{
            let ID=Model.ID
            let Street=Model.Street
            let City=Model.City
            let User_ID=Model.User_ID
            let State=Model.State
            let Zip=Model.Zip
        let parameters="ID=\(ID)&=Street\(Street)&City=\(City)&User_ID=\(User_ID)&State=\(State)&Zip=\(Zip)"
        var request = URLRequest(url: URL(string: AddressURL)!)
        request.httpMethod="POST"
            request.httpBody=parameters.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request){
            (data,_,error) in
            if let error = error {
                           // Handle HTTP request error
print(error)                       } else if let data = data {
                           // Handle HTTP request response
                           print(String(data: data, encoding: .utf8)!)
                       }
        }
        task.resume()
        }
        
    }
    func POSTShipping(){
        for Model in Shipping{
            let ID=Model.ID
            let ShippingType=Model.ShippingType
            let Cost=Model.Cost
            let eta=Model.ETA
            let User_ID=Model.User_ID
            let Status=Model.Status
            let Address_ID=Model.Address_ID
        let parameters="ID=\(ID)&ShippingType=\(ShippingType)&Cost=\(Cost)&ETA=\(eta)&User_ID=\(User_ID)Status&=\(Status)&Address_ID=\(Address_ID)"
        var request = URLRequest(url: URL(string: ShippingURL)!)
        request.httpMethod="POST"
            request.httpBody=parameters.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request){
            (data,_,error) in
            if let error = error {
                           // Handle HTTP request error
print(error)                       } else if let data = data {
                           // Handle HTTP request response
                           print(String(data: data, encoding: .utf8)!)
                       }
        }
        task.resume()
        }
    }
    func POSTPaymentMethods(){
        for Model in PaymentMethods{
            let ID=Model.ID
            let CardNumber=Model.CardNumber
            let CVC=Model.CVC
            let Expiration=Model.Expiration
            let Name=Model.Name
            let User_ID=Model.User_ID
            let Address_ID=Model.Address_ID
        let parameters="ID=\(ID)&CardNumber=\(CardNumber)&CVC=\(CVC)&Expiration=\(Expiration)&Name=\(Name)&User_ID=\(User_ID)&Address_ID=\(Address_ID)"
        var request = URLRequest(url: URL(string: ShippingURL)!)
        request.httpMethod="POST"
            request.httpBody=parameters.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request){
            (data,_,error) in
            if let error = error {
                           // Handle HTTP request error
print(error)                       } else if let data = data {
                           // Handle HTTP request response
                           print(String(data: data, encoding: .utf8)!)
                       }
        }
        task.resume()
        }
    }
    func POSTInvoice(){
        for Model in Invoice{
            let ID=Model.ID
            let Cost=Model.Cost
            let Shipping_ID=Model.Shipping_ID
            let PaymentMethods_ID=Model.PaymentMethods_ID
           
        let parameters="ID=\(ID)&Cost=\(Cost)&Shipping_ID=\(Shipping_ID)&PaymentMethods_ID=\(PaymentMethods_ID)"
        var request = URLRequest(url: URL(string: ShippingURL)!)
        request.httpMethod="POST"
            request.httpBody=parameters.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request){
            (data,_,error) in
            if let error = error {
                           // Handle HTTP request error
print(error)                       } else if let data = data {
                           // Handle HTTP request response
                           print(String(data: data, encoding: .utf8)!)
                       }
        }
        task.resume()
        }
    }
    func POSTOrders(){
        for Model in orders{
            let ID=Model.ID
            let Cost=Model.Cost
            let Description=Model.Description
            let Invoice_ID=Model.Invoice_ID
           
        let parameters="ID=\(ID)&Cost=\(Cost)&Description=\(Description)&Invoice_ID=\(Invoice_ID)"
        var request = URLRequest(url: URL(string: ShippingURL)!)
        request.httpMethod="POST"
            request.httpBody=parameters.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request){
            (data,_,error) in
            if let error = error {
                           // Handle HTTP request error
print(error)                       } else if let data = data {
                           // Handle HTTP request response
                           print(String(data: data, encoding: .utf8)!)
                       }
        }
        task.resume()
        }
    }
    
    func POSTAddress(Model:AddressModels){
        let ID=Model.ID
                   let Street=Model.Street
                   let City=Model.City
                   let User_ID=Model.User_ID
                   let State=Model.State
                   let Zip=Model.Zip
               let parameters="ID=\(ID)&=Street\(Street)&City=\(City)&User_ID=\(User_ID)&State=\(State)&Zip=\(Zip)"
               var request = URLRequest(url: URL(string: AddressURL)!)
               request.httpMethod="POST"
                   request.httpBody=parameters.data(using: String.Encoding.utf8)
               let task = URLSession.shared.dataTask(with: request){
                   (data,_,error) in
                   if let error = error {
                                  // Handle HTTP request error
       print(error)                       } else if let data = data {
                                  // Handle HTTP request response
                                  print(String(data: data, encoding: .utf8)!)
                              }
               }
               task.resume()
    }
    func POSTShipping(Model:ShippingModels){
        let ID=Model.ID
                   let ShippingType=Model.ShippingType
                   let Cost=Model.Cost
                   let eta=Model.ETA
                   let User_ID=Model.User_ID
                   let Status=Model.Status
                   let Address_ID=Model.Address_ID
               let parameters="ID=\(ID)&ShippingType=\(ShippingType)&Cost=\(Cost)&ETA=\(eta)&User_ID=\(User_ID)Status&=\(Status)&Address_ID=\(Address_ID)"
               var request = URLRequest(url: URL(string: ShippingURL)!)
               request.httpMethod="POST"
                   request.httpBody=parameters.data(using: String.Encoding.utf8)
               let task = URLSession.shared.dataTask(with: request){
                   (data,_,error) in
                   if let error = error {
                                  // Handle HTTP request error
       print(error)                       } else if let data = data {
                                  // Handle HTTP request response
                                  print(String(data: data, encoding: .utf8)!)
                              }
               }
               task.resume()
        
    }
    func POSTPaymentMethods(Model:PaymentsModels){
        let ID=Model.ID
                   let CardNumber=Model.CardNumber
                   let CVC=Model.CVC
                   let Expiration=Model.Expiration
                   let Name=Model.Name
                   let User_ID=Model.User_ID
                   let Address_ID=Model.Address_ID
               let parameters="ID=\(ID)&CardNumber=\(CardNumber)&CVC=\(CVC)&Expiration=\(Expiration)&Name=\(Name)&User_ID=\(User_ID)&Address_ID=\(Address_ID)"
               var request = URLRequest(url: URL(string: ShippingURL)!)
               request.httpMethod="POST"
                   request.httpBody=parameters.data(using: String.Encoding.utf8)
               let task = URLSession.shared.dataTask(with: request){
                   (data,_,error) in
                   if let error = error {
                                  // Handle HTTP request error
       print(error)                       } else if let data = data {
                                  // Handle HTTP request response
                                  print(String(data: data, encoding: .utf8)!)
                              }
               }
               task.resume()
    }
    func POSTInvoice(Model:InvoiceModels){
        let ID=Model.ID
                    let Cost=Model.Cost
                    let Shipping_ID=Model.Shipping_ID
                    let PaymentMethods_ID=Model.PaymentMethods_ID
                   
                let parameters="ID=\(ID)&Cost=\(Cost)&Shipping_ID=\(Shipping_ID)&PaymentMethods_ID=\(PaymentMethods_ID)"
                var request = URLRequest(url: URL(string: ShippingURL)!)
                request.httpMethod="POST"
                    request.httpBody=parameters.data(using: String.Encoding.utf8)
                let task = URLSession.shared.dataTask(with: request){
                    (data,_,error) in
                    if let error = error {
                                   // Handle HTTP request error
        print(error)                       } else if let data = data {
                                   // Handle HTTP request response
                                   print(String(data: data, encoding: .utf8)!)
                               }
                }
                task.resume()
    }
    func POSTOrders(Model:OrdersModels){
        let ID=Model.ID
                   let Cost=Model.Cost
                   let Description=Model.Description
                   let Invoice_ID=Model.Invoice_ID
                  
               let parameters="ID=\(ID)&Cost=\(Cost)&Description=\(Description)&Invoice_ID=\(Invoice_ID)"
               var request = URLRequest(url: URL(string: ShippingURL)!)
               request.httpMethod="POST"
                   request.httpBody=parameters.data(using: String.Encoding.utf8)
               let task = URLSession.shared.dataTask(with: request){
                   (data,_,error) in
                   if let error = error {
                                  // Handle HTTP request error
       print(error)                       } else if let data = data {
                                  // Handle HTTP request response
                                  print(String(data: data, encoding: .utf8)!)
                              }
               }
               task.resume()
    }
}
