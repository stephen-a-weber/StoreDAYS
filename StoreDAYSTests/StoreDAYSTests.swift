//
//  StoreDAYSTests.swift
//  StoreDAYSTests
//
//  Created by stephen weber on 3/29/22.
//

import XCTest
@testable import StoreDAYS

var testData = StoreDAYS.Data()

class StoreDAYSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }



 
     func test1DataOrder() {
         
         testData.orders = []
         
        var  singleOrder = Data.Order()
         XCTAssertTrue(singleOrder.inventoryNumber == 1)
//
//
//         testData.calculateTotalPrice()
//
//         XCTAssert(testData.totalPrice == "$12.03")
//
     }
 
     func testTaxesON1DataOrder() {
        testData.cartOrders = []
         
        let  singleOrder = Data.Order.init(name: "animal1", price: "$12.03")
         testData.cartOrders.append(singleOrder)

         testData.calculateTax()
      //   print(testData.calculateTax())
      //   var frog = 12.03 * 0.07 = 0.83
         XCTAssert(testData.taxes == "$0.84")
     }
 
     func testTaxed() {
         let price = "$100.00"
         testData.cartOrders = []
         let  singleOrder = Data.Order.init(name: "animal1", price: price)
         testData.cartOrders.append(singleOrder)
         testData.calculateTax()
         print("....",testData.taxes)
         XCTAssert( testData.taxes == "$7.00")
     }
 
     func testTaxed2() {
         let price = "$0.00"
         testData.cartOrders = []
         let  singleOrder = Data.Order.init(name: "animal1", price: price)
         testData.cartOrders.append(singleOrder)
         testData.calculateTax()
         XCTAssert(testData.taxes == "$0.00")
     }
 
     func testtotalWithTax() {
         let price = "$0.00"
         testData.cartOrders = []
         let  singleOrder = Data.Order.init(name: "animal1", price: price)
       
         testData.cartOrders.append(singleOrder)
         testData.calculateTax()
         XCTAssert(testData.taxes == "$0.00")
     }
     func testtotalWithTaxAndShipping() {
         let price = "$100.00"
         testData.cartOrders = []
         let  singleOrder = Data.Order.init(name: "animal1", price: price)
         testData.cartOrders.append(singleOrder)
         testData.calculateTotalInvoice()
         XCTAssert(testData.totalInvoice == "$117.00")
     }
     func testRound() throws{
 
         let CR = -123.0
         XCTAssert(testData.roundingAmount(amount:CR) == "-$123.00")

         let CorrectRoundable = 123.452
         XCTAssert(testData.roundingAmount(amount:CorrectRoundable) == "$123.45")

         let CR2 = 12.9951 //rounding to higher penny
         XCTAssert(testData.roundingAmount(amount:CR2) == "$13.00")

         let CR3 = 12.99499999
         XCTAssert(testData.roundingAmount(amount:CR3) == "$12.99")
     }


     func testMakeGoodDataFindFromID(){
         testData.orders = []
         let one = 1
         var anOrder = Data.Order()
         var theOrders = testData.orders
         let animalID = anOrder.id
         anOrder.name = testData.kittenProperNames[one]
         anOrder.locations.latitude = testData.kittenLatitude[one]
         anOrder.locations.longitude = testData.kittenLongitude[one]
         anOrder.price = testData.kittenPrice[one]
         anOrder.category = sellingCategory.kitten
         anOrder.description = testData.kittenDescription[one]
         anOrder.inventoryNumber = testData.kittenLitterCount[one]
         anOrder.pictureName = testData.kittenNames[one]


         theOrders.append(anOrder)
         theOrders.append(anOrder)
         XCTAssert( theOrders.count == 2)

 
 
 
     }
 
 
 
 //}

}
