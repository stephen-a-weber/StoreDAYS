//
//  Functions.swift
//  StoreDAYS
//
//  Created by admin on 4/6/22.
//

import Foundation
import SwiftUI
let AddressURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Address.php"
let ShippingURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Shipping.php"
let PaymentURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Payment.php"
let InvoiceURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Invoice.php"
let OrdersURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Orders.php"
let UpdateUser = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/UpdateUser.php"
let ItemsURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/getItems.php"

func GETInvoice(User_ID:Int, InvoiceCompletionHandler:@escaping([InvoiceModels]?,Error?)->Void){
    
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="?User_ID=\(User_ID)"
    var request=URLRequest(url: URL(string: (InvoiceURL+paremeters))!)
        request.httpMethod="GET"
    // run network task
    let task = URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode([InvoiceModels].self, from: data)
                 InvoiceCompletionHandler(JsonData,nil)
                }catch{
                    print(error)
                }
            })
            task.resume()
}
func GETInvoice(ID:Int, InvoiceCompletionHandler:@escaping(InvoiceModels?,Error?)->Void){
    
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="?ID=\(ID)"
    var request=URLRequest(url: URL(string: (InvoiceURL+paremeters))!)
        request.httpMethod="GET"
    // run network task
    let task = URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode(InvoiceModels.self, from: data)
                 InvoiceCompletionHandler(JsonData,nil)
                }catch{
                    print(error)
                }
            })
            task.resume()
}
func GetInvoiceItems(Invoice_ID:Int, InvoiceItemsCompletionHandler:@escaping([ItemModels]?,Error?)->Void){
    //creating REQUEST URL with parameters in http body and the method define
    let paremeters="?Invoice_ID=\(Invoice_ID)"
var request=URLRequest(url: URL(string: (InvoiceURL+paremeters))!)
    request.httpMethod="GET"
// run network task
let task = URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
            guard let data = data, error == nil else{
                print("error")
                return
            }
            //convert to json
            do{
                let JsonData = try JSONDecoder().decode([ItemModels].self, from: data)
                InvoiceItemsCompletionHandler(JsonData,nil)
            }catch{
                print(error)
            }
        })
        task.resume()
}
func GETOrder(Invoice_ID:Int, OrderCompletionHandler: @escaping([OrdersModels]?,Error?)->Void){
    
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="?Invoice_ID=\(Invoice_ID)"
    var request=URLRequest(url: URL(string: (OrdersURL+paremeters))!)
        request.httpMethod="GET"
    // run network task
    let task = URLSession.shared.dataTask(with: request, completionHandler:  { data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode([OrdersModels].self, from: data)
              OrderCompletionHandler(JsonData, nil)
                }catch{
                    print(error)
                }
            })
            task.resume()
}
func GETOrder(ID:Int, OrderCompletionHandler: @escaping(OrdersModels?,Error?)->Void){
    
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="?ID=\(ID)"
    var request=URLRequest(url: URL(string: (OrdersURL+paremeters))!)
        request.httpMethod="GET"
    // run network task
    let task = URLSession.shared.dataTask(with: request, completionHandler:  { data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode(OrdersModels.self, from: data)
              OrderCompletionHandler(JsonData, nil)
                }catch{
                    print(error)
                }
            })
            task.resume()
}
func POSTNewInvoice(Cost:Double,Shipping_ID:Int,User_ID:Int,OrderedItems:[ItemContainer], PaymentMethods_ID:Int){
   print("Invoice")
    print(Cost)
    print(Shipping_ID)
    print(User_ID)
    print(PaymentMethods_ID)
    print(OrderedItems)
    let parameters="Sum=\(Cost)&User_ID=\(User_ID)&Shipping_ID=\(Shipping_ID)&PaymentMethods_ID=\(PaymentMethods_ID)"
    var request = URLRequest(url: URL(string: InvoiceURL)!)
    request.httpMethod="POST"
        request.httpBody=parameters.data(using: String.Encoding.utf8)
    let task = URLSession.shared.dataTask(with: request){
        (data,_,error) in
        
        if let error = error {
                       // Handle HTTP request error
print(error)                       } else if let data = data {
    do{
        let JsonData = try JSONDecoder().decode([LastInsert].self, from: data)
        let ID=JsonData.first!.LAST_INSERT_ID
        for Item in OrderedItems{
            POSTNewOrders(Item: Item, InvoiceID: ID)
        }
    }catch{
        print(error)
    }
    
                       // Handle HTTP request response
                       
                   }
    }
    task.resume()
    
}
func POSTNewOrders(Item:ItemContainer,InvoiceID:Int){
    let Cost=Item.Cost
    let Description=Item.Description
        let Invoice_ID=InvoiceID
    let parameters="Cost=\(Cost)&Description=\(Description)&Invoice_ID=\(Invoice_ID)"
    var request = URLRequest(url: URL(string: OrdersURL)!)
    request.httpMethod="POST"
        request.httpBody=parameters.data(using: String.Encoding.utf8)
    let task = URLSession.shared.dataTask(with: request){
        (data,_,error) in
        if let error = error {
            print(error)           // Handle HTTP request error
        }
        else if let data = data {                       // Handle HTTP request response
            do{
    let JsonData = try JSONDecoder().decode(LastInsert.self, from: data)
                let ID=JsonData.LAST_INSERT_ID
                POSTOrderDetail(Items_ID: Item.ID, Order_ID: ID)
            }catch{print(error)}       }
    }
    task.resume()
    }
func POSTOrderDetail(Items_ID:Int,Order_ID:Int){
    
    let parameters="Items_ID=\(Items_ID)&Order_ID=\(Order_ID)&Quantity=1"
    var request = URLRequest(url: URL(string: OrdersURL)!)
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
func checkout(Shipment:Int,Payment:Int,Items:[ItemContainer],User_ID:Int){
    var sum=0.0

    for Item in Items{
        sum+=Item.Cost
    }
    POSTNewInvoice(Cost: sum, Shipping_ID: Shipment, User_ID: User_ID, OrderedItems: Items, PaymentMethods_ID: Payment)
    
}
func GEtItems(completion : @escaping ([ItemContainer])->(Void)){
    //what we are returning
    var AvaiavbleList = [ItemContainer]()
    //Json Array
    var Items=[ItemModels]()
    //creating REQUEST URL with parameters in http body and the method define
    var request=URLRequest(url: URL(string: (ItemsURL))!)
    request.httpMethod="GET"
    let task = URLSession.shared.dataTask(with: request) {  data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode([ItemModels].self, from: data)
                    Items=JsonData
                    for Pet in Items {
                        AvaiavbleList.append(ItemContainer(Item: Pet))
                    }
                    DispatchQueue.main.async {
                        completion(AvaiavbleList)
                        Store.TheStore.assign(given: AvaiavbleList)
                        print(AvaiavbleList.capacity)

                    }

                }catch{
                    print(": In Items")
                    print(error)
                }
            }
            task.resume()
    

}

func GETItems(Order_ID:Int,completion : @escaping ([ItemModels]?,Error?)->(Void)){
    
    //creating REQUEST URL with parameters in http body and the method define
    let paremeters="?Order_ID=\(Order_ID)"
    var request=URLRequest(url: URL(string: (ItemsURL)+paremeters)!)
    request.httpMethod="GET"
    let task = URLSession.shared.dataTask(with: request,completionHandler: {  data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode([ItemModels].self, from: data)
              completion(JsonData,nil)

                }catch{
                    print(": In Items")
                    print(error)
                }
            })
            task.resume()
    

}

func GETItems(Catagory_ID:Int,completion : @escaping ([ItemModels]?,Error?)->(Void)){

    //creating REQUEST URL with parameters in http body and the method define
    let paremeters="?Catagory_ID=\(Catagory_ID)"
    var request=URLRequest(url: URL(string: (ItemsURL)+paremeters)!)
    request.httpMethod="GET"
    let task = URLSession.shared.dataTask(with: request, completionHandler:  {  data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode([ItemModels].self, from: data)
                    completion(JsonData,nil)


                }catch{
                    print(": In Items")
                    print(error)
                }
            })
            task.resume()
    

}

func GETItems(Invoice_ID:Int,completion : @escaping ([ItemModels]?,Error?)->(Void)){
   
    //creating REQUEST URL with parameters in http body and the method define
    let paremeters="?Invoice_ID=\(Invoice_ID)"
    var request=URLRequest(url: URL(string: (ItemsURL)+paremeters)!)
    request.httpMethod="GET"
    let task = URLSession.shared.dataTask(with: request,completionHandler:  {  data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode([ItemModels].self, from: data)
                    completion(JsonData,nil)


                }catch{
                    print(": In Items")
                    print(error)
                }
            })
            task.resume()
    

}

func GETAddress(ID:Int)->[AddressModels]{
    //creating REQUEST URL with parameters in http body and the method define
    let paremeters="?ID=\(ID)"
    var request=URLRequest(url: URL(string: (AddressURL+paremeters))!)
    request.httpMethod="GET"
    var Addresses=[AddressModels]()
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode([AddressModels].self, from: data)
                    DispatchQueue.main.sync {
                        Addresses=JsonData
                    }
                }catch{
                    print(error)
                }
            }
            task.resume()
    return Addresses
}
func GETAddress(User_ID:Int, AddressCompletionHandler: @escaping([AddressModels]?,Error?)->Void){
    //creating REQUEST URL with parameters in http body and the method define
    let paremeters="?User_ID=\(User_ID)"
    var request=URLRequest(url: URL(string: (AddressURL+paremeters))!)
    request.httpMethod="GET"
    let task = URLSession.shared.dataTask(with: request, completionHandler:  { data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode([AddressModels].self, from: data)
                    AddressCompletionHandler(JsonData,nil)
             
                }catch{
                    print(error)
                }
            })
            task.resume()
}

@MainActor func POSTNewAddress(Model:AddressModels){
        let User_ID=Model.User_ID
        let Street=Model.Street
        let City=Model.City
        let State=Model.State
        let Zip=Model.Zip
    let parameters="User_ID=\(User_ID)&Street=\(Street)&City=\(City)&State=\(State)&Zip=\(Zip)"
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
func POSTNewPaymentMethods(Model:PaymentsModels){
        let CardNumber=Model.CardNumber
        let CVC=Model.CVC
        let Expiration=Model.Expiration
        let Name=Model.Name
        let User_ID=Model.User_ID
        let Address_ID=Model.Address_ID
    let parameters="CardNumber=\(CardNumber)&CVC=\(CVC)&Expiration=\(Expiration)&Name=\(Name)&User_ID=\(User_ID)&Address_ID=\(Address_ID)"
    var request = URLRequest(url: URL(string: PaymentURL)!)
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

func DeleteAddress(ID:Int){
  
let parameters="?ID=\(ID)"
var request = URLRequest(url: URL(string: AddressURL+parameters)!)
request.httpMethod="DELETE"
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
func POSTUpdateAddress(Model:AddressModels){
        let ID=Model.ID
        let Street=Model.Street
        let City=Model.City
        let State=Model.State
        let Zip=Model.Zip
    let parameters="ID=\(ID)&=Street\(Street)&City=\(City)&State=\(State)&Zip=\(Zip)"
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

