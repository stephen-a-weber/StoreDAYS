//
//  StorePlace.swift
//  StoreDAYS
//
//  Created by admin on 4/5/22.
//

import Foundation
import SwiftUI
class Store{
    

    
    @Published var Cart:[ItemModels]=[ItemModels]()
    @Published var orders:[OrdersModels]=[OrdersModels]()
    
    func getAvaibleItems(){}
    func buyCart(){}
    
}
