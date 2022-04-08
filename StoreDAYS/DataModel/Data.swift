//
//  Data.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//

import Foundation
import SwiftUI
import MapKit

struct Location :Identifiable {
    let id = UUID()
    let name :String
    let coordinate: CLLocationCoordinate2D
    let price : String
}
 

class Data: ObservableObject{

    // Main Local data object called at runtime
    struct Order :Hashable{
        var name = ""
        var price = ""
    }
    // Below the item order as of april7th is an array of Orders from structure above. When one chooses
    // and fills cart this will be the data structure available automatically everywhere
    // where the data class above is listed as  @ObservedObject var data:data
    // data.order is then a normal array which can populate lists or
    // database structures for the invoices.
    //
    @Published var order = [Order]()
    
    @Published var totalPrice : String = "$55,750.00"
    @Published var shippingPrice : String = "$350.00"
    //Currently the last Function in this file is called calculateTotalPrice()
    // It uses the correct formatting principles to convert from a string like "$45.78"
    // keeping .currency or two decimal places. It finally changes the above
    // totalPrice string into a nice usable total.
    
    @Published var name = "STOREDAY!"
    @Published var kitten : [Int] = [1,2,3,4,5,6,7,8,9,10]
    @Published var kittenNames : [String] = ["kitten1","kitten2","kitten3","kitten4","kitten5","kitten6","kitten7","kitten8","kitten9","kitten10"]
    @Published var kittenLitterCount = [ 5,3,6,2,2,5,4,6,3,4]
    @Published var kittenPrice = ["$12.99","$15.99","$19.99","$14.99","$19.99","$14.99","$19.99","$14.99","$19.99","$14.99"]
    
    @Published var puppyNames : [String] = ["puppy1","puppy2","puppy3","puppy4","puppy5","puppy6","puppy7","puppy8","puppy9","puppy10"]
    @Published var puppyLitterCount = [ 2,6,4,8,3,4,5,4,3,6]
    @Published var puppyPrice = ["$100","$234","$267","$765","$333","$666","$546","$125","$212","Free"]
    
    @Published var exoticNames: [String] = ["animal1","animal2","animal3","animal4","animal5","animal6","animal7","animal8","animal9"]
    @Published var exoticLitterCount = [2,2,2,3,2,1,2,1,1]
    @Published var exoticPrice = ["$1200","$1100","$2300","$4500","$5200","$3666","$2567","$9765","$12000"]
    
    
   
    var kittenLatitude : [Double]=[44,37,24.7,25,  40.3,-4.097,43.6,61.87,0.6921,46.36]
    var kittenLongitude : [Double]=[-89,-102,-102.2,-6.4,-5.03,-73.29,23.7,13.08,113.523,41.78]
    var puppyLatitude : [Double]=[29.9,31.8,48.43,22.44,-6.12,61.25,31.79,45.68,49.24,-5.51]
    var puppyLongitude : [Double]=[-108,-85.7,5.49,46.74,18.98,43.18,63.39,89.37,-120.813,-42.40]
    var animalLatitude : [Double]=[21.3,31.85,4.45,56.26,19.72,10.46,18.13,29.62,36.22]
    var animalLongitude : [Double]=[-77.69,0.73,33.62,64.37,78.54,77.23,96.08,110.26,137.638]

    @Published var locations = [Location]()
    init(){
        
        for item in 0..<kittenNames.count {
            let coord = CLLocationCoordinate2D(latitude:kittenLatitude[item],longitude: kittenLongitude[item])
            
            let L = Location(name: kittenNames[item], coordinate: coord ,price:kittenPrice[item])
            self.locations.append(L)
            
        }
        for item in 0..<puppyNames.count {
            let coord = CLLocationCoordinate2D(latitude:puppyLatitude[item],longitude: puppyLongitude[item])
            
            let L = Location(name: puppyNames[item], coordinate: coord ,price:puppyPrice[item])
            locations.append(L)
            
        }
        for item in 0..<exoticNames.count {
            let coord = CLLocationCoordinate2D(latitude:animalLatitude[item],longitude: animalLongitude[item])
            
            let L = Location(name: exoticNames[item], coordinate: coord,price:exoticPrice[item] )
            locations.append(L)
            
        }
    }
    
    
    
    func addToCart(item : String,price: String) {
        let x = Order(name: item, price : price)
        order.append(x)
        
    }
    
    func calculateTotalPrice() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        var dollars : Decimal = 0.0
        for i in self.order {
            
            if let number = formatter.number(from: i.price) {
                let amount = number.decimalValue
                dollars += amount
            }
            
        }
        self.totalPrice =  "$\(dollars)"
    }
    
    
}
