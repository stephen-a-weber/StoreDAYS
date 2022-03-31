//
//  KittenDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//


import SwiftUI

struct KittenDetailView: View {
    @ObservedObject var data : Data
    var kittenName = "Bob"
    var body: some View {
        
        VStack {
        Image(kittenName)
            .resizable()
            .scaledToFit()
        
    Button("Adopt this Kitten") {
        data.addToCart(item: kittenName) }
    .frame(width: 155.0, height: 60.0)
}
        
    }

    
}
    
struct KittenDetailView_Previews: PreviewProvider {
    static var previews: some View {
        KittenDetailView(data: Data(), kittenName:"kitten1")
    }
}
