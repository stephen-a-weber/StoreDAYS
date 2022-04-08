//
//  DashBoardSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/7/22.
//

import SwiftUI

struct DashBoardSwiftUIView: View {
    @State var message = ""
    @ObservedObject var data: Data
    var body: some View {
        Text("Total Orders: \(data.totalPrice)")
        }
    
    // remove is a helper function used above to remove choses
    // from the cart and the global variables we are using under data
    func remove(at offsets: IndexSet) {
        data.order.remove(atOffsets: offsets)
    }
}

func initData(){
    var db: DBHelper = DBHelper()
    var total =  db.getTotalItems()
   // message = "Your Total is : \(total)"
}

struct DashBoardSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardSwiftUIView(data: Data())
    }
}
