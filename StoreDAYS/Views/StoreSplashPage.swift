//
//  StoreSplashPage.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/29/22.
//

import SwiftUI

struct StoreSplashPage: View {
    @ObservedObject var data : Data
    
    var body: some View {
        
        NavigationView {
            NavigationLink {StoreFront(data:data)}
        label : {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 250, height: 30)
                .background(.gray)
        }
        .navigationTitle("Store DAYS")
        
        }
    
    }
}

struct StoreSplashPage_Previews: PreviewProvider {
    @ObservedObject var data : Data
    static var previews: some View {
        StoreSplashPage(data: Data())
    }
}
