//
//  StoreDAYSApp.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//

import SwiftUI

@main
struct StoreDAYSApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var data = Data()
    @StateObject var userData = UserData()
    var body: some Scene {
        WindowGroup {
            //    CheckOutView(data:data)
            //   CreateAccountSwiftUIView(userData:userData)
       //       LoginSwiftUIView()
            StoreSplashPage(data:data)
            
            //            ContentView()
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }   
    }
}
