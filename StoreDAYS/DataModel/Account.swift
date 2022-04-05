//
//  Account.swift
//  StoreDAYS
//
//  Created by admin on 4/5/22.
//

import Foundation
class account{
    
    @Published var User:UserModels=UserModels(ID: "", UserName: "", FirstName: "", LastName: "", DateOfBirth: "", Password: "", Email: "", Admin: "")
    
    @Published var Address: [AddressModel] = [AddressModel]()
    @Published var Shipping:[ShippingModel] = [ShippingModel]()
    @Published var PaymentMethods:[PaymentMethodsModel] = [PaymentMethodsModel]()
    @Published var Invoice:[InvoiceModel]=[InvoiceModel]()
    @Published var orders:[OrdersModels]=[OrdersModels]()
    
}
