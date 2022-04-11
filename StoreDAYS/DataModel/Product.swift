//
//  Product.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/8/22.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}
