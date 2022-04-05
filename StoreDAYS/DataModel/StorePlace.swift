//
//  StorePlace.swift
//  StoreDAYS
//
//  Created by admin on 4/5/22.
//

import Foundation
import SwiftUI
class Store{
    
    @Published var Cart:[ItemsModel]=[ItemsModel]()
    @Published var List:[ItemsModel]=[ItemsModel]()
    func getAvaibleItems(){}
    func buyCart(){}
}
