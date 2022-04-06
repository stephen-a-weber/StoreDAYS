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
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
                   
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
    func GETPaymentMethods()		{
        
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
        
    }
    func POSTShipping(){
        
    }
    func POSTPaymentMethods(){
        
    }
    func POSTInvoice(){
        
    }
    func POSTOrders(){
        
    }
}
