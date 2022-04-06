//
//  KeyChainManage.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/1/22.
//

import UIKit

class KeyChainManage{
    
    // MARK: - KeyChain
    // KeyChain
    func SaveData( email: String, password: String) {
        // **********   set Attributres
        let att : [String : Any] =
        [ kSecClass as String : kSecClassGenericPassword,
          kSecAttrAccount as String : email,
          kSecValueData as String : password.data(using: .utf8)!]
        
        // **********   add Data
        if SecItemAdd(att as CFDictionary,nil ) == noErr{
            print("Data Saved successfully KeyChain")
        }else{
            print("Data not saved KeyChain")
        }
        // ViewData()
    }
    
    
    func ViewDataKeyChain(email: String ) -> String{
        // Set query
        var myUser : String=""
        let q : [String : Any] = [ kSecClass  as String : kSecClassGenericPassword,
                                   kSecAttrAccount as String : email,
                                   kSecReturnAttributes as String: true,
                                   kSecReturnData as String : true]
        
        var res : CFTypeRef?
        
        if SecItemCopyMatching(q as CFDictionary, &res) == noErr{
            
            if let item = res as? [String: Any],
               let uid = item[kSecAttrAccount as String] as? String,
               let password2 = item [ kSecValueData  as String] as? Foundation.Data,
               let pass = String(data: password2, encoding: .utf8){
                print("KeyChain :Id is :", uid, " Passs is:" , pass)
                myUser = pass
            }
            else{
                print("No data Found - KeyChain")
            }
        }
        print(" d - KeyChain",myUser)
        return myUser
    }
}
