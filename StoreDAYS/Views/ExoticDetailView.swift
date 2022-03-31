//
//  ExoticDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct ExoticDetailView: View {
    @ObservedObject var data: Data
    var exoticName = "Bob"
    var body: some View {
        
        VStack {
        Image(exoticName)
            .resizable()
            .scaledToFit()
        
    Button("Adopt this Wonderful Animal") {
        data.addToCart(item: exoticName) }
    .frame(width: 155.0, height: 60.0)
}
    }
     
}

struct ExoticDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExoticDetailView(data:Data(),exoticName: "animal1")
    }
}
