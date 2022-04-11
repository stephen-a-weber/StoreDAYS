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
            DispatchQueue.main.async{
                self.Address=models!}
        })
    }
    
}
struct GetAndUseAddress: View {
    @StateObject var Model=viewAddressModel()
    @State var refresh: Bool = false

    func update() {
       refresh.toggle()
    }
    var body: some View {
        NavigationView{
            List{
                
                ForEach(Model.Address, id: \.self){
                    Address in
                    
                    
                    NavigationLink {
                        MakeAddressView(data: Data(), ID:Address.ID, Street: Address.Street, City: Address.City, State: Address.State, Zip: Address.Zip, EditFlag: true)
                    } label: {
                        AddressCell(City: Address.City, Street: Address.Street, Zip: Address.Zip, State: Address.State)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true, content: {
                        Button{
                            DeleteAddress(ID: Address.ID)
                            Model.loadAddresses(User_ID: 2)
                        }label:{Label("Delete", systemImage: "trash")}
                    })
                               
                                          
            }
            }
            .padding(.trailing)
            
            .onAppear{
                Model.loadAddresses(User_ID: 2)
            }
            .navigationTitle("Address Book")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink {
                        MakeAddressView(data: Data(), User_ID: 2)
                    } label: {
                        Image(systemName: "plus")
                    }

                }

            }

        }
        
        
    }
}

struct GetAndUseAddress_Previews: PreviewProvider {
    static var previews: some View {
        GetAndUseAddress()
    }
}
