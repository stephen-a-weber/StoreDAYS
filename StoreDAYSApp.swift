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
    //@StateObject var data = ItemContainer()
    @StateObject var userData = UserData()
    var body: some Scene {
        WindowGroup {
            GetAndUseAddress()
            //SwiftUIView()
            //    CheckOutView(data:data)
          //    CreateAccountSwiftUIView(data: data)
       //     LoginSwiftUIView(data: data)
           // StoreSplashPage(data:data)
        //    TabSwiftMoreUIView(data: data)
           // StoreView()
           // tabs(data: data)
            //            ContentView()
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }   
    }
}
