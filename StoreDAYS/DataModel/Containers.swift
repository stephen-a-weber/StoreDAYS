//
//  Containers.swift
//  StoreDAYS
//
//  Created by admin on 4/6/22.
//

import Foundation
import SwiftUI


class ItemContainer:ObservableObject, Identifiable ,Equatable {
    static func == (lhs: ItemContainer, rhs: ItemContainer) -> Bool {
        return lhs.ID==rhs.ID
    }
    init(){
        }
    init(Item:ItemModels){
        self.Item=Item
        convert()
    }
     func convert(){
         self.ID=Item.ID
        Name=Item.Name
        Description=Item.Description
        Cost=Double(Item.Cost)!
        Catagory_ID=Item.Catagory_ID
        Img=Item.Name
        Availability=Item.Availability
    }
    func addtoCart(items:ItemContainer){
        if !Store.TheStore.Cart.order.contains(items){
            Store.TheStore.Cart.order.append(items)}
        for i in Store.TheStore.Cart.order{
            print(i.Name)
        }
       
    }
    init(Item:ItemModels,Reviews:[ReviewModels]){
        self.Item=Item
        self.Review=Reviews
    }
    @Published var order = [ItemContainer]()
    @Published var Review:[ReviewModels]=[ReviewModels]()
    @Published var Item: ItemModels = ItemModels(ID: 0, Name: "", Description: "", Cost: "", Catagory_ID: 0, Img: "", Availability: 0)
    @Published var id=UUID()
    @Published var ID=0
    @Published var Name=""
    @Published var Description=""
    @Published var Cost=0.0
    @Published var Catagory_ID=0
    @Published var Img:String=""
    @Published var Availability=0
    
}
