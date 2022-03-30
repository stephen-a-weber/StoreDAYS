//
//  KittenDetalView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct KittenDetalView: View {
    var kittenName = "Bob"
    var body: some View {
        Image("kitten1")
            .resizable()
            .scaledToFit()
    }
}

struct KittenDetalView_Previews: PreviewProvider {
    static var previews: some View {
        KittenDetalView(kittenName: "kitten1")
    }
}
