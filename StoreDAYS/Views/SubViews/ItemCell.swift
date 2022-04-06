//
//  ItemCell.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct ItemCell: View {
    var kittenName = "kitten8"
    var litter = 0
    var price = "amount"
 //  @State var number : Int = 4
   // @ObservedObject var data : Data
    var body: some View {
        HStack {
            
            Image(kittenName)
            
                .resizable()
                .frame(width: 100, height:100)
            Text("There are \(litter) left from this litter.")
            
            Spacer()
            Text(price)
                .padding(.all, 10.0)
            
            
        }
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(kittenName: "kitten8",litter: 1234,price:"$456.00")
    }
}
