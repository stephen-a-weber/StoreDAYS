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
    let count : Int
}
enum sellingCategory {
    case kitten
    case puppy
    case exotic
    
}

 class Data: ObservableObject, Identifiable{
    
   struct Order :Identifiable{
        
        let id = UUID()
        var name = ""
        var locations = CLLocationCoordinate2D(latitude:0,longitude: 0 )
        var price = ""
        var category = sellingCategory.kitten
        var description = ""
        var inventoryNumber : Int = 1
        var pictureName = ""
        
    }
    @Published var itemOrder = Order()
    @Published var orders = [Order]()
    @Published var puppyViewOrders = [Order]()
    @Published var kittenViewOrders = [Order]()
    @Published var exoticViewOrders = [Order]()
    @Published var cartOrders = [Order]()
   
    func addToCart(item : Order) {
        
        self.cartOrders.append(item)
        
    }
    
    
    
////information to be kept during checkout
//
//    struct Order :Hashable{
//        var name = ""
//        var price = ""
//    }
//    // Below the item order as of april7th is an array of Orders from structure above. When one chooses
    // and fills cart this will be the data structure available automatically everywhere
    // where the data class above is listed as  @ObservedObject var data:data
    // data.order is then a normal array which can populate lists or
    // database structures for the invoices.
    //
  //  @Published var order = [Order]()
    
    @Published var totalPrice : String = "$0.00"
    @Published var shippingPrice : String = "$10.00"
    @Published var taxes         : String = "7%"
    @Published var totalInvoice   : String = "00.00"
    @Published var address         : String = ""
    //Currently the last Function in this file is called calculateTotalPrice()
    // It uses the correct formatting principles to convert from a string like "$45.78"
    // keeping .currency or two decimal places. It finally changes the above
    // totalPrice string into a nice usable total.
    
    var kittenProperNames=["Cuddles",
                           "Bubbles","Daisy","Hope","Ivy","June","Olive","Pearl","Willow","Violet"]
    var kittenDescription = ["Cuddles Family of Kittens",
                             "A family of smiling cats.",
                             "Kittens with College Degrees.",
                             "Pretty Sure Santa raised these cuties.",
                             "Friendship forever.",
                             "These are from an immortal lineage.",
                             "These kittens had a color named after them.",
                             "Definitely a musical purring box.",
                             "Long live this Royal cat family.",
                             "Happily ever after."]
    @Published var name = "STOREDAY!"
    @Published var kitten : [Int] = [1,2,3,4,5,6,7,8,9,10]
    @Published var kittenNames : [String] = ["kitten1","kitten2","kitten3","kitten4","kitten5","kitten6","kitten7","kitten8","kitten9","kitten10"]
    @Published var kittenLitterCount = [ 5,3,6,2,2,5,4,6,3,4]
    @Published var kittenPrice = ["$12.99","$15.99","$19.99","$14.99","$19.99","$14.99","$19.99","$14.99","$19.99","$14.99"]
    let puppy = [1,2,3,4,5,6,7,8,9,10]
    let puppyProperNames = ["Cuddles",
                            "Bubbles","Daisy","Hope","Ivy","June","Olive","Pearl","Willow","Violet"]
    let puppyDescription = ["Cuddles Family of Puppies",
                            "A family of smiling dogs.",
                            "Puppies with College Degrees.",
                            "Pretty Sure Santa raised these cuties.",
                            "Friendship forever.",
                            "These are from an immortal lineage.",
                            "These puppies had a color named after them.",
                            "Definitely a musical bark.",
                            "Long live this Royal dog family.",
                            "Happily ever after."]
    @Published var puppyNames : [String] = ["puppy1","puppy2","puppy3","puppy4","puppy5","puppy6","puppy7","puppy8","puppy9","puppy10"]
    @Published var puppyLitterCount = [ 2,6,4,8,3,4,5,4,3,6]
    @Published var puppyPrice = ["$100","$234","$267","$765","$333","$666","$546","$125","$212","$145"]
    
    @Published var exoticNames: [String] = ["animal1","animal2","animal3","animal4","animal5","animal6","animal7","animal8","animal9"]
    @Published var exoticLitterCount = [2,2,2,3,2,1,2,1,1]
    @Published var exoticPrice = ["$1200","$1100","$2300","$4500","$5200","$3666","$2567","$9765","$12000"]
    
    let exotic = [1,2,3,4,5,6,7,8,9]
    let exoticProperNames = ["Cuddles",
                             "Bubbles","Daisy","Hope","Ivy","June","Olive","Pearl","Willow"]
    let exoticDescription = ["Cuddles Family of Fabulous animals",
                             "A family of smiling animals.",
                             "Interesting animals with College Degrees.",
                             "Pretty Sure Santa raised these cuties.",
                             "Friendship forever.",
                             "These are from an immortal lineage.",
                             "These animals had a color named after them.",
                             "They Definitely make musical sounds.",
                             "Long live this Royal animal family."]
    
   
    var kittenLatitude : [Double]=[44,37,24.7,25,  40.3,-4.097,43.6,61.87,0.6921,46.36]
    var kittenLongitude : [Double]=[-89,-102,-102.2,-6.4,-5.03,-73.29,23.7,13.08,113.523,41.78]
    var puppyLatitude : [Double]=[29.9,31.8,48.43,22.44,-6.12,61.25,31.79,45.68,49.24,-5.51]
    var puppyLongitude : [Double]=[-108,-85.7,5.49,46.74,18.98,43.18,63.39,89.37,-120.813,-42.40]
    var animalLatitude : [Double]=[21.3,31.85,4.45,56.26,19.72,10.46,18.13,29.62,36.22]
    var animalLongitude : [Double]=[-77.69,0.73,33.62,64.37,78.54,77.23,96.08,110.26,137.638]

    @Published var locations = [Location]()
    init(){
        cartOrders = []
        var count = 0
        for item in 0..<kittenNames.count {
            
            let coord = CLLocationCoordinate2D(latitude:kittenLatitude[item],longitude: kittenLongitude[item])
            var order = Order()
            order.name = kittenProperNames[item]
            order.locations=coord
            order.price=kittenPrice[item]
            order.category=sellingCategory.kitten
            order.description=kittenDescription[item]
            order.inventoryNumber = kittenLitterCount[item]
            order.pictureName = kittenNames[item]
            orders.append(order)
            kittenViewOrders.append(order)
            let L = Location(name: kittenNames[item], coordinate: coord ,price:kittenPrice[item],count: count)
            self.locations.append(L)
            count+=1
            
        }
        for item in 0..<puppyNames.count {
            let coord = CLLocationCoordinate2D(latitude:puppyLatitude[item],longitude: puppyLongitude[item])

            var order = Order()
            order.name = puppyProperNames[item]
            order.locations=coord
            order.price=puppyPrice[item]
            order.category=sellingCategory.puppy
            order.description=puppyDescription[item]
            order.inventoryNumber = puppyLitterCount[item]
            order.pictureName = puppyNames[item]
            orders.append(order)
            puppyViewOrders.append(order)
            
            
            
            let L = Location(name: puppyNames[item], coordinate: coord ,price:puppyPrice[item],count:count)
            locations.append(L)
            count+=1
            
        }
        for item in 0..<exoticNames.count {
            let coord = CLLocationCoordinate2D(latitude:animalLatitude[item],longitude: animalLongitude[item])

            var order = Order()
            order.name = exoticProperNames[item]
            order.locations=coord
            order.price=exoticPrice[item]
            order.category=sellingCategory.exotic
            order.description=exoticDescription[item]
            order.inventoryNumber = exoticLitterCount[item]
            order.pictureName = exoticNames[item]
            orders.append(order)
            exoticViewOrders.append(order)

            
            
            
            let L = Location(name: exoticNames[item], coordinate: coord,price:exoticPrice[item],count:count )
            locations.append(L)
            count+=1
            
        }
    }
    
    
    
 
  
    
    func calculateTotalPrice()->Void {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        var dollars : Decimal = 0.0
        for i in self.cartOrders.indices{
            let item = cartOrders[i].price
            if let number = formatter.number(from: item) {
                let amount = number.decimalValue
                dollars += amount
            }

        }
        print("In this routine we print \(dollars)")
        self.totalPrice =  "$\(dollars)"
    }
    
    
    
     
    func calculateShipping() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        var dollars : Decimal = 0.0
        for i in self.cartOrders  {

            if let number = formatter.number(from: i.price) {
                let amount = number.decimalValue
                dollars += amount
            }

        }
        if dollars > 200 {
            self.shippingPrice =  "$0.00"
        }else{
            self.shippingPrice =  "$10.00"
        }

    }
    // Taxes
    func calculateTax() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        var dollars : Decimal = 0.0
        var tax     : Decimal = 0.0
        for i in self.cartOrders {
            
            if let number = formatter.number(from: i.price) {
                let amount = number.decimalValue
                dollars += amount
            }
            
        }
        tax = (dollars * 0.07)
       
        var Tx = Double(tax.description) ?? 0
        Tx = round(Tx * 100) / 100
        
        
        //Proper way to convert from a double
        // to currency in Swiftui
        let r = NumberFormatter.localizedString(from:NSNumber(value:Tx),number:.currency)
     
    
        
            self.taxes =  "\(r)"
    }
    
    

    func calculateTotalInvoice() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        var dollars : Decimal = 0.0
        var total     : Decimal = 0.0

        for i in self.cartOrders {

            if let number = formatter.number(from: i.price) {
                let amount = number.decimalValue
                dollars += amount
            }

        }
        total = dollars + (dollars * 0.07)
        if dollars > 200 {
            total += 0
            self.shippingPrice = "$0.00"
        }else{
            total += 10
            self.shippingPrice = "$10.00"
        }
        




        var TTL = Double(total.description) ?? 0
        TTL = round(TTL * 100) / 100

        //proper way to do this ensuring $.00 two places at zero
        let r = NumberFormatter.localizedString(from:NSNumber(value:TTL),number:.currency)
        print("HERE IS ",r)
        self.totalInvoice =  "\(r)"
    }
     
     
     func roundingAmount(amount: Double)->String {
         //money rounding
         let roundable = round(amount * 100) / 100
         let answer = NumberFormatter.localizedString(from:NSNumber(value:roundable),number:.currency)
         return answer
     }
}
