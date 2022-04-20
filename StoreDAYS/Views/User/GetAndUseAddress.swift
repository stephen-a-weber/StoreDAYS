//
//  GetAndUseAddress.swift
//  StoreDAYS
//
//  Created by admin on 4/8/22.
//

import SwiftUI
class viewAddressModel: ObservableObject{
    @Published var Address :[AddressModels] = []

    func loadAddresses(User_ID:Int){
        GETAddress(User_ID: User_ID, AddressCompletionHandler: { models, error in
            DispatchQueue.main.sync{self.Address=models!}
        })
    }
    
}
struct GetAndUseAddress: View {
    @ObservedObject var data: Data
    @State var EditOrUse=false
    @State var CartOrAccount=false
    @StateObject var Model=viewAddressModel()

    var body: some View {
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
                           InvoiceSwiftUIView(data: data)
                            NavigationLink (destination:CardBook(CartOrAccount: true, data: data, User_ID: data.UserInformation.ID)){
                                
                                Button{
                                data.AddressInformation=Address
                                Data.initdata.AddressInformation=Address
                                }label:{
                                    AddressCell(City: Address.City, Street: Address.Street, Zip: Address.Zip, State: Address.State)
                                }
                            }.isDetailLink(false)
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
