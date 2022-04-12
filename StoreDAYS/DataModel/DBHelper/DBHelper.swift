//
//  DBHelper.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/2/22.
//


import Foundation

import SQLite3

class DBHelper {
    
    
    ///Users/davidgonzalez/Library/Developer/CoreSimulator/Devices/18884C22-EC75-491D-8D15-3B66A943C77B/data/Containers/Data/Application/FDC6D6AD-66EB-4C40-900D-4F40B6EB78D2/Documents/shopDAYS.sqlite
    
    init() {
        db = openDatabase()
        createUsersDataTable()
        createTableItems()
        initialItems()
        getTotalItems()
        getTotalItemsAmount()
        createTableInvoice()
 
    }
    
    let dbPath: String = "shopDAYS.sqlite"
    var db: OpaquePointer?
    //MARK: Open Data Base
    func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
         
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at:::::::::::::::::::::::::::::::::::::::::::::::: \(fileURL.path)")
            return db
        }
    }
    
    //MARK: Functions USERS
    
    func createUsersDataTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS Users(Id INTEGER PRIMARY KEY AUTOINCREMENT,UserName TEXT UNIQUE, FirstName TEXT,LastName TEXT, DateOfBirth TEXT,password TEXT, Email TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Users table created.")
            } else {
                print("Users table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insertUsers(UserName: String,FirstName: String, LastName: String , DateOfBirth: String , Password: String, Email: String) {
        let insertStatementString = "INSERT INTO Users( UserName,FirstName, LastName , DateOfBirth , Password, Email) VALUES (?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            //            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 1, (UserName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (FirstName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (LastName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (DateOfBirth as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (Password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (Email as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row, User exist.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func getUsersN() -> [UserData] {
        let queryStatementString = "SELECT * FROM users;"
        var queryStatement: OpaquePointer? = nil
        var psns: [UserData] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                let UserName = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let password = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                
                let email = sqlite3_column_int(queryStatement, 4)
                // psns.append(UserData( Int32(id) as! Decoder  ,UserName,FirstName, password, email))
                //   psns.append(UserData(from: Decoder.self as! Decoder))
                print("Query Result:")
                print("\(id) | \(UserName) | \(password) | \(email)")
                let user=UserData()
                user.ID=Int(id)
                user.UserName=UserName
                user.Password=password
                user.Email=String(email)
                psns.append(user)
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
    
    //MARK: Functions Orders
    

    
    func createTableItems() {
        let createTableString = "CREATE TABLE IF NOT EXISTS Items(Id INTEGER PRIMARY KEY AUTOINCREMENT,Name TEXT UNIQUE, Description TEXT,Cost TEXT, Catagory_ID TEXT, Img TEXT, Availability TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Items table created.")
            } else {
                print("Items table could not be created.")
            }
        } else {
            print("CREATE TABLE Items statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    

    func insertItems(Name: String,Description: String, Cost: String , Catagory_ID: String , IMG: String, Availability: String) {
        let insertStatementString = "INSERT INTO Items( Name,Description, Cost , Catagory_ID , IMG, Availability) VALUES (?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            //            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 1, (Name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (Description as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (Cost as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (Catagory_ID as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (IMG as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (Availability as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row, User exist.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func getTotalItems() -> Int {
        let queryStatementString = "select  count(*) total_order FROM Items;"
        var queryStatement: OpaquePointer? = nil
        var total: Int=0
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let tot = sqlite3_column_int(queryStatement, 0)
                total = Int(tot)
                
           
           
//                print("Quiz Sessions Query Result:")
//                print("\(questionId) | \(answerText) | \(sequence)")
            }
        } else {
            print("total_order SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        print("Total de Ordenes :", total)
        return total
    }
    
    func getTotalItemsAmount() -> Int {
        let queryStatementString = "select    sum (CAST(Cost as decimal))  costo  FROM Items;"
        var queryStatement: OpaquePointer? = nil
        var total: Int=0
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let tot = sqlite3_column_int(queryStatement, 0)
                total = Int(tot)
                
           
 
            }
        } else {
            print(" ELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        print("Total de Amount Ordenes :", total)
        return total
    }
    
    
    func createTableInvoice() {
        let createTableString = "CREATE TABLE IF NOT EXISTS Invoice(Id INTEGER PRIMARY KEY AUTOINCREMENT,Number TEXT UNIQUE, Date DATE, Tax TEXT, SubTotal TEXT, Total TEXT, Adress TEXT, User TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Invoice table created.")
            } else {
                print("Invoice table could not be created.")
            }
        } else {
            print("CREATE TABLE Invoice statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    func initialItems(){
        insertItems(Name:"Snow", Description: "White/Black", Cost: "20.00", Catagory_ID: "1", IMG: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten1.jpeg", Availability: "1")
        insertItems(Name:"Tiger", Description: "White/Black", Cost: "20.00", Catagory_ID: "1", IMG: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten1.jpeg", Availability: "1")
        insertItems(Name:"Bear", Description: "White/Black", Cost: "20.00", Catagory_ID: "1", IMG: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten6.jpeg", Availability: "1")
        insertItems(Name:"Max", Description: "White/Black", Cost: "20.00", Catagory_ID: "1", IMG: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten10.jpeg", Availability: "1")
        insertItems(Name:"Fredrick", Description: "Big eyes", Cost: "20.00", Catagory_ID: "1", IMG: "http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal7.jpeg", Availability: "1")
          
    }
    
}
