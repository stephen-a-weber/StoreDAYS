//
//  StorePlace.swift
//  StoreDAYS
//
//  Created by admin on 4/5/22.
//

import Foundation
import SwiftUI
class Store: ObservableObject{
    static let TheStore=Store()

    init(){
        print("initStore")
        GEtItems { (Item) in
            self.allItems=Item        }
        print(allItems.capacity)
    }
    func assign(given:[ItemContainer]){
        allItems=given
    }
    
    @ObservedObject var Cart=ItemContainer()
    @Published var orders:[OrdersModels]=[OrdersModels]()
    @Published var allItems=[ItemContainer]()
    func getAvaibleItems(){}
    func buyCart(){}
    
}
