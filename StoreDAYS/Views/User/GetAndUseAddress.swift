//
//  GetAndUseAddress.swift
//  StoreDAYS
//
//  Created by admin on 4/8/22.
//

import SwiftUI

struct GetAndUseAddress: View {
    @State var moveToNext = false
    @ObservedObject var data: Data
    @State var CartOrAccount=false
    @StateObject var Model=viewAddressModel()
    var body: some View {
        NavigationLink(isActive:$moveToNext) {CardBook(CartOrAccount: true, data: data, User_ID: data.UserInformation.ID)}label:{
            
            
        }.isDetailLink(false).hidden().zIndex(0)
        Group{
            List{
                
                ForEach(Model.Address, id: \.self){
                    Address in
                    
                    if(!CartOrAccount){
                        NavigationLink {
                            MakeAddressView(data: data, ID:Address.ID, Street: Address.Street, City: Address.City, State: Address.State, Zip: Address.Zip, EditFlag: true)
                        } label: {
                            AddressCell(City: Address.City, Street: Address.Street, Zip: Address.Zip, State: Address.State)
                        }.isDetailLink(false)
                        
                    }else{
                        Button{
                            data.AddressInformation=Address
                            Data.initdata.AddressInformation=Address
                            moveToNext.toggle()
                        }label:{
                            AddressCell(City: Address.City, Street: Address.Street, Zip: Address.Zip, State: Address.State)
                        }
                        
                        
                    }
                    
                    
                    
                }.onDelete(perform: {index in
                    
                    DeleteAddress(ID:Model.Address[index[index.startIndex]].ID)
                    Model.Address.remove(atOffsets: index)
                    Model.loadAddresses(User_ID: Data.initdata.UserInformation.ID)}
                )
            }
        }
        .padding(.trailing)
        
        .onAppear{
            Model.loadAddresses(User_ID: Data.initdata.UserInformation.ID)
        }
        .navigationTitle("Address Book")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                NavigationLink {
                    MakeAddressView(data: data, User_ID: Data.initdata.UserInformation.ID)
                } label: {
                    Image(systemName: "plus")
                    
                    
                }
                
            }
            
        }
        
        
    }
}

struct GetAndUseAddress_Previews: PreviewProvider {
    static var previews: some View {
        GetAndUseAddress(data: Data())
    }
}
