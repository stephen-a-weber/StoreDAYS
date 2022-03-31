//
//  PuppyDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct PuppyDetailView: View {
    @ObservedObject var data: Data
    var puppyName = "Bob"
    var body: some View {
        
        
        VStack {
        Image(puppyName)
            .resizable()
            .scaledToFit()
        
    Button("Adopt this Puppy") {
        data.addToCart(item: puppyName) }
    .frame(width: 155.0, height: 60.0)
}
        }
    
}

struct PuppyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PuppyDetailView(data: Data(),puppyName: "puppy1")
    }
}
