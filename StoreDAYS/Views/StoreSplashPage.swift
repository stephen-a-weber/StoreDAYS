//
//  StoreSplashPage.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//

import SwiftUI

struct StoreSplashPage: View {
    @ObservedObject var data : Data
   @State private var enterStore = false
    
    var body: some View {
        NavigationView {
        ZStack {
           
            Image("pet-image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
                .onTapGesture {
                    enterStore.toggle()
                }
            
                NavigationLink("",  destination: TabbedMainView(data:data),isActive: $enterStore)
        Spacer()
            
            }
        }
        }
        
    }


struct StoreSplashPage_Previews: PreviewProvider {
    @ObservedObject var data : Data
    static var previews: some View {
        StoreSplashPage(data: Data())
    }
}
