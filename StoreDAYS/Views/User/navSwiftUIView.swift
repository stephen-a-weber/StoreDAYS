//
//  navSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/5/22.
//

import SwiftUI

struct navSwiftUIView: View {
    var body: some View {
        NavigationView {
                    VStack {
                        Text("")
                        NavigationLink(destination: VideoArkOfSuffering()) {
                            Text("Rescue Animals")
                        }
                    }
                }
    }
}

struct navSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        navSwiftUIView()
    }
}
