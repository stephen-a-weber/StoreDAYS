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
 
    
}
