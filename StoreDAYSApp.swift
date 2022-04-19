//
//  StoreDAYSApp.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//

import SwiftUI

@main
struct StoreDAYSApp: App {
    @StateObject var data = Data()
    @StateObject var userData = UserData()
    var body: some Scene {
        WindowGroup {
       
            StoreSplashPage(data:data)
        }   
    }
}
