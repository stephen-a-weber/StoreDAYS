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
struct ViewCell: View {
    var Name = "kitten8"
    var litter = 0
    var price = 0.0
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
            
            Image(Name)
            
                .resizable()
                .frame(width: 100, height:100)
            Text("There are \(litter) left from this litter.")
            
            Spacer()
            Text(String(price))
                .padding(.all, 10.0)
            
            
        }
    }
}

struct ViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ViewCell(Name: "kitten8",litter: 1234,price:0.0)
    }
}
