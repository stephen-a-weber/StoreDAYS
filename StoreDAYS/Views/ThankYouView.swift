//
//  ThankYouView.swift
//  StoreDAYS
//
//  Created by admin on 4/20/22.
//

import SwiftUI

struct ThankYouView: View {
    @StateObject var data : Data

@State var presenting = false
    var body: some View {
        Button{
            presenting.toggle()
        }label: {
            Text("Thank You for your order , your going to enjoy it")
        }.fullScreenCover(isPresented: $presenting){
            ContentView(data: Data.initdata)
        }
        
    }
}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouView(data:Data())
    }
}
