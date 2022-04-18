    //
    //  StoreDAYSApp.swift
    //  StoreDAYS
    //
    //  Created by stephen weber on 3/29/22.
    //

import SwiftUI

@main
struct StoreDAYSApp: App {
    @Environment(\.scenePhase) var scenePhase
        // This was NotificationCenter, but has been grouped for lifetime events in
        // swiftui under an environment variable.
        // Used because splash screen has a custom transition and needs a global variable
        // saving bool state for store or splash in AppStorage OH. And using scenePhase
        // such that if app is closed or inactive etc. state reverts to splashscreen on restart.
    
    
    
    
    @AppStorage("OH") var OH = true
   // @StateObject var data = Data()
    
    
    var body: some Scene {
        WindowGroup {
                //TabbedMainView(data:data)
                //StoreSplashPage(data:data)
            hmm()
        }
       
        .onChange(of: scenePhase) { newScenePhase in
            
            switch newScenePhase {
                
            case .background:
                OH = true
            case .inactive:
                OH = true
            case .active:
                OH = true
            @unknown default:
                print("Pay attention this is some unknown state....")
            }
              
        }
    }
        
}
