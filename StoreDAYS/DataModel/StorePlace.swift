//
//  StorePlace.swift
//  StoreDAYS
//
//  Created by admin on 4/5/22.
//

import Foundation
import SwiftUI
class Store{
    static let TheStore=Store()

    init(){}

    
    @Published var Cart:[ItemContainer]=[ItemContainer]()
    @Published var orders:[OrdersModels]=[OrdersModels]()
    @Published var allItems=GEtItems()
    func getAvaibleItems(){}
    func buyCart(){}
    
}
