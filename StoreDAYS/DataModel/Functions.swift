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
//
//func POSTItmes(Item:ItemModels){
//    for Model in Item{
//        let ID=Item.ID
//        let Name=Item.Name
//        let Description=Item.Description
//        let Cost=Item.Cost
//        let Catagory_ID=Item.Catagory_ID
//        let Img=Item.Img
//        let Availability=Item.Availability
//    let parameters="ID=\(ID)&=Name\(Name)&Description=\(Description)&Cost=\(Cost)&Catagory_ID=\(Catagory_ID)&Img=\(Img)&Availability=\(Availability)"
//    var request = URLRequest(url: URL(string: AddressURL)!)
//    request.httpMethod="POST"
//        request.httpBody=parameters.data(using: String.Encoding.utf8)
//    let task = URLSession.shared.dataTask(with: request){
//        (data,_,error) in
//        if let error = error {
//                       // Handle HTTP request error
//print(error)                       } else if let data = data {
//                       // Handle HTTP request response
//                       print(String(data: data, encoding: .utf8)!)
//                   }
//    }
//    task.resume()
//    }
//
//}
