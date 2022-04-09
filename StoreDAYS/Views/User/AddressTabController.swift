//
//  AddressTabController.swift
//  StoreDAYS
//
//  Created by admin on 4/8/22.
//

import SwiftUI


struct AddressTabController: View {
    @State var Street=""
    @State var City=""
    @State var State=""
    @State var Zip=""
    var body: some View {
        TabView{
            GetAndUseAddress()
                .tabItem{
                    Label("Existing Address", systemImage:"")
            }
            MakeAddressView()
                .tabItem{
                    Label("Existing Address", systemImage:"")
            }
            
        }
        
    }
}

struct AddressTabController_Previews: PreviewProvider {
    static var previews: some View {
        AddressTabController()
    }
}
