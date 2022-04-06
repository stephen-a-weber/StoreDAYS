//
//  UtilityModelController.swift
//  StoreDAYS
//
//  Created by admin on 4/6/22.
//

import Foundation
let OrdersURL = "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/Orders.php"

class invoiceContainer{
    init(Invoice:InvoiceModels){
        self.Invoice=Invoice
        self.orders=[OrdersModels]()
        GETOrders()
    }
    init(Invoice:InvoiceModels,Orders:[OrdersModels]){
        self.Invoice=Invoice
        self.orders=Orders
    }
    var orders:[OrdersModels]
    var Invoice: InvoiceModels
    func GETOrders(){
        let paremeters="?Invoice=\(self.Invoice.ID)"

            //creating REQUEST URL with parameters in http body and the method define
        var request=URLRequest(url: URL(string: (OrdersURL+paremeters))!)
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
    func POSTOrders(){
           for Model in orders{
               let ID=Model.ID
               let Cost=Model.Cost
               let Description=Model.Description
               let Invoice_ID=Model.Invoice_ID
              
           let parameters="?ID=\(ID)&Cost=\(Cost)&Description=\(Description)&Invoice_ID=\(Invoice_ID)"
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
       }
       func POSTOrders(Model:OrdersModels){
           let ID=Model.ID
                      let Cost=Model.Cost
                      let Description=Model.Description
                      let Invoice_ID=Model.Invoice_ID
                     
                  let parameters="?ID=\(ID)&Cost=\(Cost)&Description=\(Description)&Invoice_ID=\(Invoice_ID)"
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
}

class ReviewContainer{
    init(Item:ItemModels,Reviews:[ReviewModels]){
        self.Item=Item
        self.Review=Reviews
    }
    var Review:[ReviewModels]
    var Item: ItemModels}
