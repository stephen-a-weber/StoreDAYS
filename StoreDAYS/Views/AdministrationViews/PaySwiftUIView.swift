//
//  PaySwiftUIView.swift
//  StoreDAYS
//

//

import SwiftUI

struct PaySwiftUIView: View {
    @State var user: String = ""
    var body: some View {
        
        VStack {
            Text( " Pay")
            Text(user)
        }
       
    }
}

struct PaySwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PaySwiftUIView(user: "ddt")
    }
}
