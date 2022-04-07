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
        List {
            
            ForEach(data.order, id:\.self) { item in
                HStack {
                    Image(item.name)
                        .resizable()
                        .frame(width:100,height:100)
                        .padding()
                    Spacer()
                    VStack{
                        Text("You ordered \(item.name)")
                        .padding()
                        Text("The price is \(item.price)")
                    }
                }
            }
           // .onDelete(perform: remove)
            .onAppear(perform: data.calculateTotalPrice)
            Text("Total Price = \(data.totalPrice)")
        }
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
