//
//  CheckOutView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct CheckOutView: View {
    @ObservedObject var data: Data
   //  var order : [String] = []
    var body: some View {
    //    NavigationView {
            Section{
                VStack {
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
            Spacer()
               Spacer()
                    NavigationLink {
                        
                        LoginSwiftUIView()}
                label: {
                        Text("Continue To Payment")
                            .fontWeight(.bold)
                            .foregroundColor(Color("myBlue"))
                            .frame( maxWidth: .infinity,  alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("myBlue"),lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                    }
                    Spacer()
              
                
                
            
        //        }
            }
            .navigationTitle("Your Future Friends :")
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
