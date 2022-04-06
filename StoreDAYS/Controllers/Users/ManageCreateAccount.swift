//
//  ManageCreateAccount.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/5/22.
//

import Foundation

class ManageCreateAccount {
    var appGetUserFromAWS = ManageUserFromAWS()
    var keyChainManage = KeyChainManage()
    var db: DBHelper = DBHelper()
    //Validate password match password confirm
    func validatePass(pass1: String, pass2: String) -> Bool{
        if pass1 == pass2 {
            return true
        }else{
            return false
        }
    }
    // Save KeyChain
    func saveUserKeyChain(email: String , password: String) {
        keyChainManage.SaveData(email: email, password: password)
    }
    // AWS Service
    func insertUserAWSService(userName: String,firstName: String, lastName: String, email: String, password: String){
        appGetUserFromAWS.insertUserAWSService(userName: email,firstName: firstName, lastName: lastName, email: email, password: password)
    }
    // Save Data Base SqLite local
    func saveUserDB(userName: String,firstName: String, lastName: String , dateOfBirth: String , password: String, email: String) {
        db.insertUsers(UserName: email,FirstName: firstName, LastName: lastName , DateOfBirth: "01-01-1980" , Password: password, Email: email)
    }
    
}
