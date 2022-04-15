//
//  ItemCell.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI
///// There are three item cell subViews. files here is one
/// One for kittens , puppies and animals
/// could have made an enum but this works too
///
struct ItemCell: View {
    var kittenName = "kitten8"
    var litter = 0
    var price = "amount"
    ////  there are three variables grabbed from data and these three files for item cells
    /// are too keep each file small and clear as too its purpose.
    ///
    ///
    /// A cell has an image
    /// then some text
    /// then the price
    ///
    /// all laid out horizontally
    
    
    
    
    
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
