//
//  ReviewList.swift
//  StoreDAYS
//
//  Created by admin on 4/5/22.
//

import SwiftUI

struct ReviewList: View {
    @State var fruits: [String] = ["apple","orange","banana", "peach"]
    @State var veggies: [String] = ["tomato","potato", "carrot"]
    var body: some View {
        NavigationView{
        List{
            Section(header: Text("Fruits")){
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit.capitalized)
            }
            .onMove(perform: move)
            .onDelete (perform: delete)
                
            }
            Section(header: Text("veggies")) {
                ForEach(veggies, id: \.self) { veggies in
                    Text(veggies.capitalized)
                }
                                    
            }
        }
        .listStyle(GroupedListStyle())
            
            .navigationTitle("List")
            .navigationBarItems(leading: EditButton(), trailing: addButton )

          }
        
    }
    var addButton: some View{
        Button("Add", action:add)
    }
    func add(){
        fruits.append("Cocnut")
    }
        func delete(indexSet:IndexSet){
        fruits.remove(atOffsets: indexSet)
    }
    func move (start:IndexSet,end:Int){
        fruits.move(fromOffsets: start, toOffset: end)
    }
    
struct ReviewList_Previews: PreviewProvider {
    static var previews: some View {
        ReviewList()
    }
}
}
