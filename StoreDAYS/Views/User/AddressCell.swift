//
//  AddressCell.swift
//  StoreDAYS
//
//  Created by admin on 4/11/22.
//

import SwiftUI

struct AddressCell: View {
    @State var City = ""
    @State var Street = ""
    @State var Zip = ""
    @State var State = ""
    var body: some View {
        HStack{
            VStack{
                Text("Street:\(Street)")
                Text("City:\(City)")
            }
            VStack{
                    Text("State:\(State)")
                    Text("Zip:\(Zip)")
            }
        }
    }
}

struct AddressCell_Previews: PreviewProvider {
    static var previews: some View {
        AddressCell(City: "San Diego", Street: " 2145 Corte Vista", Zip: "91915", State: "CA")
    }
}
