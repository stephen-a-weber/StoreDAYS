//
//  Containers.swift
//  StoreDAYS
//
//  Created by admin on 4/6/22.
//

import Foundation
import SwiftUI
import MapKit

class TheItemContainer:ObservableObject, Identifiable ,Equatable{
    static func == (lhs: TheItemContainer, rhs: TheItemContainer) -> Bool {
        return lhs.Item.ID==rhs.Item.ID
    }
    init(){
        }
    init(Item:ItemModels){
        self.Item=Item
    }
    init(Item:ItemModels,Reviews:[ReviewModels]){
        self.Item=Item
        self.Review=Reviews
    }
    @Published var location:Location=Location(name: "Item.Name", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), price: 0.0, Item:  ItemModels(ID: 0, Name: "", Description: "", Cost: 0.0, Catagory_ID: 0, Img: "", Availability: 0, Longitude: 0.0, Latitude: 0.0))

    @Published var Review:[ReviewModels]=[ReviewModels(ID: 0, Body: "No Body", User_ID: 0, Rate: 0, Items_ID: 1, Catagory_ID: 1)]
    @Published var Item: ItemModels = ItemModels(ID: 0, Name: "", Description: "", Cost: 0.0, Catagory_ID: 0, Img: "", Availability: 0, Longitude: 0.0, Latitude: 0.0)
    @Published var id=UUID()
    func load(){
        self.location=Location(name: Item.Name, coordinate: CLLocationCoordinate2D(latitude: Item.Latitude, longitude: Item.Latitude), price: Item.Cost, Item: Item)
        GETReview(Items_ID: Item.ID, ReviewCompletionHanlder:  { GivenReviews, error in
            DispatchQueue.main.sync{self.Review=GivenReviews!}})
        print(self.Review.capacity)
        }
    }
class viewAddressModel: ObservableObject{
    @Published var Address :[AddressModels] = []

    func loadAddresses(User_ID:Int){
        GETAddress(User_ID: User_ID, AddressCompletionHandler: { models, error in
            DispatchQueue.main.sync{self.Address=models!}
        })
    }
    
}
class viewCardModel: ObservableObject{
    @Published var Cards:[PaymentsModels]=[]
    func loadCard(User_ID:Int){
        GETPaymentMethods(User_ID: User_ID, PaymentCompletionHandler: { Cards, error in
            DispatchQueue.main.sync{self.Cards=Cards!}
        })
    }
}
class viewInvoiceListModel:ObservableObject{
    @Published var InvoicesModel :[InvoiceModels]=[]
    @Published var Containers:[Invoices]=[]
    
    func loadOrdersIntoInvoice(){
        for invoice in InvoicesModel{
            var InvoiceOrders=[Orders]()
            GETOrder(Invoice_ID: invoice.ID) { DataOrders, error in
                for Order in DataOrders!{
                    GETItems(Order_ID: Order.ID) { Items, error in
                        InvoiceOrders.append(Orders(SelfOrder: Order, Items: Items!))
                        
                    }
                }
                
                
            }
            DispatchQueue.main.async {
                self.Containers.append(Invoices(SelfInvoice: invoice, Order:InvoiceOrders))
            }
        }
    }
    func loadInvoices(User_ID:Int){
        GETInvoice(User_ID: User_ID, InvoiceCompletionHandler: { Invoices, error in
            DispatchQueue.main.async {
                self.InvoicesModel=Invoices!
                self.loadOrdersIntoInvoice()
            }
        })
    }
    func load(User_ID:Int){
        loadInvoices(User_ID: User_ID)
        loadOrdersIntoInvoice()
    }
}
