//
//  PuppyDetailView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct PuppyDetailView: View {
    var puppyName = "Bob"
    var body: some View {
        Image(puppyName)
            .resizable()
            .scaledToFit()
    }
}

struct PuppyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PuppyDetailView()
    }
}
