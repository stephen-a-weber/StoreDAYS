//
//  CheckOutView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var data: Data
     var order : [String] = []
    var body: some View {
        NavigationView {
            Section{
            List {
                
                ForEach(data.order, id:\.self) { item in
                    HStack {
                    Image(item)
                            .resizable()
                            .frame(width:100,height:100)
                            .padding()
                        Spacer()
                    Text("You ordered \(item)")
                            .padding()
                    }
                }
                .onDelete(perform: remove)
                
                
                
            }
            }
            .navigationTitle("Here is your Order?")
            .listStyle(InsetGroupedListStyle())
            
        }
      
        
        
    }
    func remove(at offsets: IndexSet) {
        data.order.remove(atOffsets: offsets)
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(data:Data())
    }
}
