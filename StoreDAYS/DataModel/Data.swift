//
//  Data.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//

import Foundation
import SwiftUI
class Data: ObservableObject {
    
    @Published var name = "STOREDAY!"
    @Published var kitten : [Int] = [1,2,3,4]
    @Published var kittenNames : [String] = ["kitten1","kitten2","kitten3","kitten4"]
    @Published var kittenLitterCount = [ 5,3,6,2]
    @Published var kittenPrice = ["$12.99","$15.99","$19.99","$14.99"]
    
    @Published var puppyNames : [String] = ["puppy1","puppy2","puppy3","puppy4","puppy5","puppy6","puppy7","puppy8","puppy9","puppy10"]
    @Published var puppyLitterCount = [ 2,6,4,8,3,4,5,4,3,6]
    @Published var puppyPrice = ["$100","$234","$267","$765","$333","$666","$546","$125","$212","Free"]
    
    @Published var exoticNames: [String] = ["animal1","animal2","animal3","animal4","animal5","animal6","animal7","animal8","animal9"]
    @Published var exoticLitterCount = [2,2,2,3,2,1,2,1,1]
    @Published var exoticPrice = ["$1200","$1100","$2300","$4500","$5200","$3666","$2567","$9765","$12000"]
}
