//
//  ItemCell2.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct ItemCell2: View {
    var puppyName = "fido"
    var litter = 234
    var price = "$45000"
   // @State var number : Int = 6
     var body: some View {
         HStack {
             
             Image(puppyName)
             
                 .resizable()
                 .frame(width: 100, height:100)
             Text("There are \(litter) left from this litter.")
             
             Spacer()
             Text(price)
                 .padding(.all, 10.0)
             
             
         }
     }
 }

struct ItemCell2_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell2()
    }
}
