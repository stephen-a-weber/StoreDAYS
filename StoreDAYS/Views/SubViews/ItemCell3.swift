//
//  ItemCell3.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct ItemCell3: View {
    var exoticName = "Harry Potter"
    var exoticLitter = 56
    var exoticPrice = "$45000"
    @State var number : Int = 4
     var body: some View {
         HStack {
             
             Image(exoticName)
             
                 .resizable()
                 .frame(width: 100, height:100)
             Text("There are \(exoticLitter) left from this litter.")
             
             Spacer()
             Text(exoticPrice)
                 .padding(.all, 10.0)
             
             
         }
     }
 }


struct ItemCell3_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell3()
    }
}
