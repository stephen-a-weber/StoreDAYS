//
//  KittenDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//


import SwiftUI

struct KittenDetailView: View {
    var kittenName = "Bob"
    var body: some View {
        Image(kittenName)
            .resizable()
            .scaledToFit()
    }
}

struct KittenDetailView_Previews: PreviewProvider {
    static var previews: some View {
        KittenDetailView(kittenName: "kitten1")
    }
}
