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
    let price : Double
    let Item:ItemModels
}
 
func NumberToDollar(Tottal:Double)->String{
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter.string(from: NSNumber(value: Tottal))!
}
class Data: ObservableObject{
     static let initdata = Data()
//information to be kept during checkout
    @Published var CardInformation:PaymentsModels=PaymentsModels(ID: 0, CardNumber: "", CVC: "", Expiration: "", Name: "", User_ID: 0, Address_ID: 0)
    @Published var AddressInformation:AddressModels=AddressModels(ID: 0, Street: "", City: "", User_ID: 0, State: "", Zip: "")
    @Published var UserInformation:UserModels=UserModels(ID: 0, UserName: "", FirstName: "", LastName: "", DateOfBirth: "", Password: "", Email: "", Admin: "")
    @Published var ShippingInformation:ShippingModels=ShippingModels(ID: 0, ShippingType: "", Cost: 0.0, ETA: "", User_ID: 0, Status: "", Address_ID: 0)
    @Published var ItemedCart:[TheItemContainer]=[]
    @Published var AvaiableItems:[TheItemContainer]=[]
    @Published var PuppyItems:[TheItemContainer]=[]
    @Published var KittenItems:[TheItemContainer]=[]
    @Published var AnimalItems:[TheItemContainer]=[]
    func addtoItemedCart(Item:TheItemContainer){
       ItemedCart.append(Item)
        
        print("size is \(ItemedCart.capacity)")
    }
    func loadDataIntoLocation(){
        for Item in AvaiableItems{
            locations.append(Item.location)
        }
    }
    func loadDataBaseIntoItems(){
        GETItems { GivenItems, error in
            for GivenItem in GivenItems!{
                DispatchQueue.main.sync{self.AvaiableItems.append(TheItemContainer(Item: GivenItem))}}
        }
        for CatagoryID in 1...3{
            GETItems(Catagory_ID: CatagoryID, completion: {GivenItems, error in
                switch CatagoryID{
                case 1:
                    for GivenItem in GivenItems!{
                        DispatchQueue.main.sync{self.KittenItems.append(TheItemContainer(Item: GivenItem))}}
                    break
                case 2:
                    for GivenItem in GivenItems!{
                        DispatchQueue.main.sync{self.PuppyItems.append(TheItemContainer(Item: GivenItem))}}

                    break
                case 3:
                    for GivenItem in GivenItems!{
                        DispatchQueue.main.sync{self.AnimalItems.append(TheItemContainer(Item: GivenItem))}}

                    break
                default:
                    print("Should never get to this point")
                    break
                }
            })}
        
    }
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
    
    @Published var totalPrice : Double = 0.00
    @Published var shippingPrice : Double = 10.00
    @Published var taxes         : Double = 0.07
    @Published var totalInvoice   : Double = 00.00
    @Published var addres         : String = "33 60 NY city Patagonia Argentina"
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
    @Published var puppyPrice = ["$100","$234","$267","$765","$333","$666","$546","$125","$212","$145"]
    
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
        loadDataBaseIntoItems()
        for GivenItem in AvaiableItems {
            let coord = CLLocationCoordinate2D(latitude:GivenItem.Item.Latitude,longitude:GivenItem.Item.Longitude)
            
            let L = Location(name: GivenItem.Item.Name, coordinate: coord, price: GivenItem.Item.Cost, Item: GivenItem.Item)
            self.locations.append(L)
        }
    }
    
    
    
    func addToCart(item : String,price: String) {
        let x = Order(name: item, price : price)
        order.append(x)
        
    }
  
    func calculateTotalPrice() {
        print("Caculating for : \(Data.initdata.ItemedCart.description)")
        var dollars=0.0
        for item in Data.initdata.ItemedCart {
            dollars+=item.Item.Cost
        }
        Data.initdata.totalPrice =  dollars
    
    // Shipping
 
        if dollars > 200 {
            Data.initdata.shippingPrice =  0.00
        }else{
            Data.initdata.shippingPrice =  10.00
        }
      
    
        
        if dollars > 200 {
            dollars += 0
        }else{
            dollars += 10
        }
        // Taxes

            var Tx = (dollars * 0.07)
            Tx = round(Tx * 100) / 100
            
         
            
            Data.initdata.taxes =  Tx

let total = dollars + (dollars * 0.07)
        
        
        
   //the math didnt make since so
        var TTL = total
        TTL = round(TTL * 100) / 100
        
        Data.initdata.totalInvoice =  total
    }
}

