//
//  Functions.swift
//  StoreDAYS
//
//  Created by admin on 4/6/22.
//

import Foundation
import SwiftUI
let OrderDetailURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/OrderDetail.php"
let AddressURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Address.php"
let ShippingURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Shipping.php"
let PaymentURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Payment.php"
let InvoiceURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Invoice.php"
let OrdersURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Orders.php"
let UpdateUser = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/UpdateUser.php"
let ItemsURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/getItems.php"
let ReviewURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Review.php"
let SearchUserURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/SearchUser.php"
let SignUpURL="http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Signup.php"
let SignInURL="http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/login.php"

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
func GETPaymentMethods(User_ID:Int,PaymentCompletionHandler:@escaping([PaymentsModels]?,Error?)->Void)        {
    
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="?User_ID=\(User_ID)"
    var request=URLRequest(url: URL(string: (PaymentURL+paremeters))!)
    request.httpMethod="GET"
    // run network task
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
                    //convert to json
                    do{
                        let JsonData = try JSONDecoder().decode([PaymentsModels].self, from: data)
                        PaymentCompletionHandler(JsonData, nil)
                    }catch{
                        print(error)
                    }
                })
                task.resume()
}

func GETShipping(ID:Int,ShippingComplete:@escaping(ShippingModels?,Error?)->Void)        {
    
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="?ID=\(ID)"
    var request=URLRequest(url: URL(string: (ShippingURL+paremeters))!)
    request.httpMethod="GET"
    // run network task
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
                    //convert to json
                    do{
                        let JsonData = try JSONDecoder().decode([ShippingModels].self, from: data)
                        ShippingComplete(JsonData.first!, nil)
                        
                    }catch{
                        print("In Shipping")
                        print(error)
                    }
                })
                task.resume()
}
func GETPaymentMethods(ID:Int,PaymentCompletionHandler:@escaping(PaymentsModels?,Error?)->Void)        {
    
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="?ID=\(ID)"
    var request=URLRequest(url: URL(string: (PaymentURL+paremeters))!)
    request.httpMethod="GET"
    // run network task
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
                    //convert to json
                    do{
                        let JsonData = try JSONDecoder().decode([PaymentsModels].self, from: data)
                        PaymentCompletionHandler(JsonData.first!, nil)
                    }catch{
                        print(error)
                    }
                })
                task.resume()
}
func GETReview(Items_ID:Int, ReviewCompletionHanlder:@escaping([ReviewModels]?,Error?)->Void){
    
        //creating REQUEST URL with parameters in http body and the method define
        let paremeters="?Items_ID=\(Items_ID)"
    var request=URLRequest(url: URL(string: (ReviewURL+paremeters))!)
    request.httpMethod="GET"
    // run network task
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
                    guard let data = data, error == nil else{
                        print("error")
                        return
                    }
            print(String(data:data, encoding:.utf8) ?? " ")
                    //convert to json
                    do{
                        let JsonData = try JSONDecoder().decode([ReviewModels].self, from: data)
                        ReviewCompletionHanlder(JsonData, nil)
                    }catch{
                        print(error)
                    }
                })
                task.resume()
}
func PostReview(Model:ReviewModels){
    
    let parameters="Items_ID=\(Model.Items_ID)&Body=\(Model.Body)&Rate=\(Model.Rate)&=\(Model.Catagory_ID)&User_ID=\(Model.User_ID)"
    
           var request = URLRequest(url: URL(string: ReviewURL)!)
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
func POSTNEWPaymentMethods(Model:PaymentsModels){
               let CardNumber=Model.CardNumber
               let CVC=Model.CVC
               let Expiration=Model.Expiration
               let Name=Model.Name
               let User_ID=Model.User_ID
               let Address_ID=Model.Address_ID
           let parameters="CardNumber=\(CardNumber)&CVC=\(CVC)&Expiration=\(Expiration)&Name=\(Name)&User_ID=\(User_ID)&Address_ID=\(Address_ID)"
    print(parameters)
           var request = URLRequest(url: URL(string: PaymentURL)!)
           request.httpMethod="POST"
               request.httpBody=parameters.data(using: String.Encoding.utf8)
           let task = URLSession.shared.dataTask(with: request){
               (data,_,error) in
               if let error = error {
                   print("NewPayment")
                              // Handle HTTP request error
   print(error)                       } else if let data = data {
                              // Handle HTTP request response
                              print(String(data: data, encoding: .utf8)!)
                          }
           }
           task.resume()
}

func POSTNEWPaymentMethods(Model:PaymentsModels,PaymentIDCompletionHandler:@escaping(Int?,Error?)->Void){
               let CardNumber=Model.CardNumber
               let CVC=Model.CVC
               let Expiration=Model.Expiration
               let Name=Model.Name
               let User_ID=Model.User_ID
               let Address_ID=Model.Address_ID
           let parameters="CardNumber=\(CardNumber)&CVC=\(CVC)&Expiration=\(Expiration)&Name=\(Name)&User_ID=\(User_ID)&Address_ID=\(Address_ID)"
    print(parameters)
           var request = URLRequest(url: URL(string: PaymentURL)!)
           request.httpMethod="POST"
               request.httpBody=parameters.data(using: String.Encoding.utf8)
           let task = URLSession.shared.dataTask(with: request, completionHandler: {
               (data,_,error) in
               if let error = error {
                              // Handle HTTP request error
   print(error)                       } else if let data = data {
                              // Handle HTTP request response
       do{
           let JsonData = try JSONDecoder().decode([LastInsert].self, from: data)
           let ID=JsonData.first!.LAST_INSERT_ID
           PaymentIDCompletionHandler(ID,nil)
       }catch{
           print("NewPAyment")
           print(error)
       }                          }
           })
           task.resume()
}


func POSTUpdatePaymentMethods(Model:PaymentsModels){
               let CardNumber=Model.CardNumber
               let CVC=Model.CVC
               let Expiration=Model.Expiration
               let Name=Model.Name
               let ID=Model.ID
               let Address_ID=Model.Address_ID
           let parameters="ID=\(ID)CardNumber=\(CardNumber)&CVC=\(CVC)&Expiration=\(Expiration)&Name=\(Name)&Address_ID=\(Address_ID)"
    print(parameters)
           var request = URLRequest(url: URL(string: PaymentURL)!)
           request.httpMethod="POST"
               request.httpBody=parameters.data(using: String.Encoding.utf8)
           let task = URLSession.shared.dataTask(with: request){
               (data,_,error) in
               if let error = error {
                              // Handle HTTP request error
   print(error)                       } else if let data = data {
       print(String(data: data, encoding: .utf8)!)

                              // Handle HTTP request response
                          }
           }
           task.resume()
}
func GETInvoice(ID:Int, InvoiceHandler:@escaping (InvoiceModels?,Error?)->Void){
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
                InvoiceHandler(JsonData,nil)
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
func POSTNewInvoice(Model:InvoiceModels, items:Data){
 
    let OrderedItems = Data.initdata.ItemedCart
    let parameters="Sum=\(Model.Cost)&User_ID=\(Model.User_ID)&Shipping_ID=\(Model.Shipping_ID)&PaymentMethods_ID=\(Model.PaymentMethods_ID)"
    print(parameters)
    var request = URLRequest(url: URL(string: InvoiceURL)!)
    request.httpMethod="POST"
        request.httpBody=parameters.data(using: String.Encoding.utf8)
    let task = URLSession.shared.dataTask(with: request){
        (data,_,error) in
        
        if let error = error {
                       // Handle HTTP request error
print(error)                       } else if let data = data {
    print(String(data:data, encoding: .utf8) ?? " ")
    print(OrderedItems.capacity)
    do{
        let JsonData = try JSONDecoder().decode([LastInsert].self, from: data)
        let ID=JsonData.first!.LAST_INSERT_ID
        for Item in OrderedItems{
            POSTNewOrders(Item: Item.Item, InvoiceID: ID)
        }
    }catch{
        print("NewInvoice")
        print(error)
    }
    
                       // Handle HTTP request response
                       
                   }
    }
    task.resume()
    
}
func GETSearchUser(Email:String, UserIDCompletionHandler:@escaping(Int?,Error?)->Void){
    let parameters="?Email=\(Email)"
    var request=URLRequest(url: URL(string: (SearchUserURL+parameters))!)
    request.httpMethod="GET"
    let task = URLSession.shared.dataTask(with: request) {  data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode(IDModel.self, from: data)
                    UserIDCompletionHandler(JsonData.ID,nil)
                    
                }catch{
                    print(": In Search User")
                    print(error)
                }
            }
            task.resume()
    

}
func DynamicCheckOut(data:Data){
    if (data.UserInformation.ID==0){
        GETSearchUser(Email: data.UserInformation.Email) { ID, error in
            if(ID! == 0){
                print("Doing NEW New")
                POSTSignUp(Info: data.UserInformation) { GivenUserID, error in
                    let AddressModel = AddressModels(ID: 0, Street: data.AddressInformation.Street, City: data.AddressInformation.City, User_ID: GivenUserID!, State: data.AddressInformation.State, Zip: data.AddressInformation.Zip)
                    
                    POSTNewAddress(Model: AddressModel, AddressIDCompletionHandler: {
                        GivenAddressID, error in
                       
                        
                        let ShippingModel=ShippingModels(ID: 0, ShippingType: data.ShippingInformation.ShippingType, Cost: data.ShippingInformation.Cost, ETA: data.ShippingInformation.ETA, User_ID: GivenUserID!, Status: data.ShippingInformation.Status, Address_ID: GivenAddressID!)
                        POSTNewShipping(Model: ShippingModel, ShippingIDCompletionHandler: {
                            GivenShippingID, error in
                            let PaymentModel=PaymentsModels(ID: 0, CardNumber: data.CardInformation.CardNumber, CVC: data.CardInformation.CVC, Expiration: data.CardInformation.Expiration, Name: data.CardInformation.Name, User_ID: GivenUserID!, Address_ID: GivenAddressID!)
                            POSTNEWPaymentMethods(Model: PaymentModel, PaymentIDCompletionHandler: {
                                GivenPaymentID, error in
                                let InvoiceModel:InvoiceModels=InvoiceModels(ID: 0, Cost: Data.initdata.totalInvoice, User_ID: GivenUserID!, Shipping_ID: GivenShippingID!, PaymentMethods_ID:GivenPaymentID!)
                              
                                POSTNewInvoice(Model: InvoiceModel, items:data)

                            })
                        })
                        
                    })
                    
                  
                }
            }
            else{
                print("Found Guest")
                    let AddressModel = AddressModels(ID: 0, Street: data.AddressInformation.Street, City: data.AddressInformation.City, User_ID: ID!, State: data.AddressInformation.State, Zip: data.AddressInformation.Zip)
                    POSTNewAddress(Model: AddressModel, AddressIDCompletionHandler: {
                        GivenAddressID, error in
                       
                        let PaymentModel=PaymentsModels(ID: 0, CardNumber: data.CardInformation.CardNumber, CVC: data.CardInformation.CVC, Expiration: data.CardInformation.Expiration, Name: data.CardInformation.Name, User_ID: ID!, Address_ID: GivenAddressID!)
                        POSTNEWPaymentMethods(Model: PaymentModel, PaymentIDCompletionHandler: {
                            GivenPaymentID, error in
                            let ShippingModel=ShippingModels(ID: 0, ShippingType: data.ShippingInformation.ShippingType, Cost: data.ShippingInformation.Cost, ETA: data.ShippingInformation.ETA, User_ID: ID!, Status: data.ShippingInformation.Status, Address_ID: GivenAddressID!)
                            POSTNewShipping(Model: ShippingModel, ShippingIDCompletionHandler: {
                                GivenShippingID, error in
                                var InvoiceModel:InvoiceModels=InvoiceModels(ID: 0, Cost: 0.0, User_ID: ID!, Shipping_ID: 0, PaymentMethods_ID: 0)
                                    InvoiceModel=InvoiceModels(ID: 0, Cost: InvoiceModel.Cost, User_ID: InvoiceModel.User_ID, Shipping_ID: GivenShippingID!, PaymentMethods_ID: GivenPaymentID!)
                                POSTNewInvoice(Model: InvoiceModel, items: data)

                                
                            })
                        })
                        
                        
                        
                    
                    
                  
                }
                    )
            }
                    
        }
    }else{
        var InvoiceModel:InvoiceModels=InvoiceModels(ID: 0, Cost:data.totalInvoice, User_ID: data.UserInformation.ID, Shipping_ID: 0, PaymentMethods_ID: data.CardInformation.ID)
        
        let ShippingModel=ShippingModels(ID: 0, ShippingType: data.ShippingInformation.ShippingType, Cost: data.ShippingInformation.Cost, ETA: data.ShippingInformation.ETA, User_ID: data.UserInformation.ID, Status: data.ShippingInformation.Status, Address_ID: data.AddressInformation.ID)
        POSTNewShipping(Model: ShippingModel, ShippingIDCompletionHandler: {
            GivenShippingID, error in
            DispatchQueue.main.sync {
                print("inCART: \(data.ItemedCart.description)")
                InvoiceModel=InvoiceModels(ID: 0, Cost: InvoiceModel.Cost, User_ID: InvoiceModel.User_ID, Shipping_ID: GivenShippingID!, PaymentMethods_ID: InvoiceModel.PaymentMethods_ID)
                POSTNewInvoice(Model: InvoiceModel, items: data)

            }
        })
        
    }
    
}
func POSTSignUp(Info:UserModels, SignupHandler:@escaping(Int?,Error?)->Void){
    let Password:String
    if(Info.Password==""){
        Password="123Password!"
    }else{
        Password=Info.Password
    }
    
    let parameters="FirstName=\(Info.FirstName)&LastName=\(Info.LastName)&Email=\(Info.Email)&Password=\(Password)"
    var request = URLRequest(url: URL(string: SignUpURL)!)
    request.httpMethod="POST"
        request.httpBody=parameters.data(using: String.Encoding.utf8)
    let task = URLSession.shared.dataTask(with: request){
        (data,_,error) in
        if let error = error {
            print(error)           // Handle HTTP request error
        }
        else if let data = data {
            print(String(data:data, encoding: .utf8) ?? " ")

            // Handle HTTP request response
            do{

    let JsonData = try JSONDecoder().decode([LastInsert].self, from: data)
                let ID=JsonData.first!.LAST_INSERT_ID
                SignupHandler(ID,nil)
            }catch{
                print("Signup")
                print(error)}       }
    }
    task.resume()
}

func POSTSignIn(Email:String,Password:String, SignupHandler:@escaping(UserModels?,Error?)->Void){
  
    
    let parameters="Email=\(Email)&Password=\(Password)"
    var request = URLRequest(url: URL(string: SignInURL)!)
    request.httpMethod="POST"
        request.httpBody=parameters.data(using: String.Encoding.utf8)
    let task = URLSession.shared.dataTask(with: request){
        (data,_,error) in
        if let error = error {
            print(error)           // Handle HTTP request error
        }
        else if let data = data {
            print(String(data:data, encoding: .utf8) ?? " ")

            // Handle HTTP request response
            do{

    let JsonData = try JSONDecoder().decode([UserModels].self, from: data)
                SignupHandler(JsonData.first!,nil)
            }catch{
                print("Signup")
                print(error)}       }
    }
    task.resume()
}
func POSTNewOrders(Item:ItemModels,InvoiceID:Int){
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
            print("NewOrder")
            print(error)           // Handle HTTP request error
        }
        else if let data = data {                       // Handle HTTP request response
            do{
    let JsonData = try JSONDecoder().decode([LastInsert].self, from: data)
                let ID=JsonData.first!.LAST_INSERT_ID
                POSTOrderDetail(Items_ID: Item.ID, Orders_ID: ID)
            }catch{print(error)
                print("NewOrder")
            }       }
    }
    task.resume()
    }

func POSTOrderDetail(Items_ID:Int,Orders_ID:Int){
    
    let parameters="Items_ID=\(Items_ID)&Orders_ID=\(Orders_ID)&Quantity=1"
    var request = URLRequest(url: URL(string: OrderDetailURL)!)
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


func GETItems(Order_ID:Int,completion : @escaping (ItemModels?,Error?)->(Void)){
    
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
                    print(JsonData)
                    completion(JsonData.first ?? ItemModels(ID: 0, Name: "Error", Description: "Error", Cost: 0, Catagory_ID: 0, Img: "Error", Availability: 0, Longitude: 0, Latitude: 0),nil)

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

func GETItems(completion : @escaping ([ItemModels]?,Error?)->(Void)){

    //creating REQUEST URL with parameters in http body and the method define
    var request=URLRequest(url: URL(string: (ItemsURL))!)
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


func GETItems(ID:Int,completion : @escaping (ItemModels?,Error?)->(Void)){

    //creating REQUEST URL with parameters in http body and the method define
    let paremeters="?ID=\(ID)"
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
                    completion(JsonData.first!,nil)
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

func GETAddress(ID:Int, SingleCompletionAddressHandler:@escaping(AddressModels?,Error?)->Void){
    //creating REQUEST URL with parameters in http body and the method define
    let paremeters="?ID=\(ID)"
    var request=URLRequest(url: URL(string: (AddressURL+paremeters))!)
    request.httpMethod="GET"
    print(paremeters)
    let task = URLSession.shared.dataTask(with: request, completionHandler:  { data, _, error in
                guard let data = data, error == nil else{
                    print("error")
                    return
                }
                //convert to json
                do{
                    let JsonData = try JSONDecoder().decode([AddressModels].self, from: data)
                    SingleCompletionAddressHandler(JsonData.first!,nil)
                }catch{
                    print("In address")
                    print(error)
                }
            })
            task.resume()
    
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
func POSTNewShipping(Model:ShippingModels, ShippingIDCompletionHandler:@escaping(Int?,Error?)->Void){
   
    let parameters="ShippingType=\(Model.ShippingType)&Cost=\(Model.Cost)&ETA=\(Model.ETA)&User_ID=\(Model.User_ID)&Status=\(Model.Status)&Address_ID=\(Model.Address_ID)"
    var request = URLRequest(url: URL(string: ShippingURL)!)
    request.httpMethod="POST"
        request.httpBody=parameters.data(using: String.Encoding.utf8)
    let task = URLSession.shared.dataTask(with: request, completionHandler: {
        (data,_,error) in
        if let error = error {
                       // Handle HTTP request error
print(error)                       } else if let data = data {
                       // Handle HTTP request response
    print(String(data:data,encoding: .utf8) ?? " ")
    do{
        let JsonData = try JSONDecoder().decode([LastInsert].self, from: data)
        let ID=JsonData.first!.LAST_INSERT_ID
        ShippingIDCompletionHandler(ID,nil)
    }catch{
            print("In new Address")
        ShippingIDCompletionHandler(nil,error)
        }
                   }
    })
    task.resume()
}
func POSTNewAddress(Model:AddressModels, AddressIDCompletionHandler:@escaping(Int?,Error?)->Void){
        let User_ID=Model.User_ID
        let Street=Model.Street
        let City=Model.City
        let State=Model.State
        let Zip=Model.Zip
    let parameters="User_ID=\(User_ID)&Street=\(Street)&City=\(City)&State=\(State)&Zip=\(Zip)"
    var request = URLRequest(url: URL(string: AddressURL)!)
    request.httpMethod="POST"
        request.httpBody=parameters.data(using: String.Encoding.utf8)
    let task = URLSession.shared.dataTask(with: request, completionHandler: {
        (data,_,error) in
        if let error = error {
                       // Handle HTTP request error
print(error)                       } else if let data = data {
                       // Handle HTTP request response
    do{
        let JsonData = try JSONDecoder().decode([LastInsert].self, from: data)
        let ID=JsonData.first!.LAST_INSERT_ID
        AddressIDCompletionHandler(ID,nil)
    }catch{
            print("In new Address")
            AddressIDCompletionHandler(nil,error)
        }
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
                   print(String(data: data, encoding: .utf8) ?? " ")
               }
}
task.resume()
}

func DeleteCard(ID:Int){
  
let parameters="?ID=\(ID)"
var request = URLRequest(url: URL(string: PaymentURL+parameters)!)
request.httpMethod="DELETE"
    request.httpBody=parameters.data(using: String.Encoding.utf8)
let task = URLSession.shared.dataTask(with: request){
    (data,_,error) in
    if let error = error {
                   // Handle HTTP request error
print(error)                       } else if let data = data {
                   // Handle HTTP request response
                   print(String(data: data, encoding: .utf8) ?? " ")
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
 func isToDate(day: String)->Date{
         let dateFormatter = DateFormatter()
         dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
         dateFormatter.dateFormat = "yyyy-MM-dd"
         return dateFormatter.date(from: day)!
     }
      func DatetoString(day: Date)->String{
         let dateFormatter = DateFormatter()
         dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
         dateFormatter.dateFormat = "yyyy-MM-dd"
         return dateFormatter.string(from: day)
     }

     func formatDate(date: Date)->String {
        
        let formatter = DateFormatter()
        formatter.dateFormat="MMMM dd yyyy"
        return formatter.string(from: date)
    
    }
    
    
func formatetoDate(s:String)->Date {
        
        print("format to date",s)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat="MMMM dd, yyyy"
        return formatter.date(from: s)!
    
    }
