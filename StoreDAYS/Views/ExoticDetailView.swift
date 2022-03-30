//
//  ExoticDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct ExoticDetailView: View {
    var exoticName = "Bob"
    var body: some View {
        Image(exoticName)
            .resizable()
            .scaledToFit()
    }
}

struct ExoticDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExoticDetailView()
    }
}
