//
//  AccountTab.swift
//  StoreDAYS
//
//  Created by admin on 4/18/22.
//

import SwiftUI

struct AccountTab: View {
    @ObservedObject var data: Data
    @State var IsloggedIn = false
    var body: some View {
            VStack(alignment: .leading){
            if IsloggedIn{
                Group{
                    NavigationLink {
                InvoiceList(data:data)
            } label: {
                Label("Invoices",systemImage:"heart.text.square.fill")

            }.isDetailLink(false)
                        .padding(.top, 100)
            NavigationLink {
                GetAndUseAddress(data:data)

            } label: {
                Label("Locations", systemImage:"house.fill")

            }.isDetailLink(false)
                        .padding(.top, 20)
            NavigationLink {
                CardBook(data: data)

            } label: {
                Label("Cards",systemImage:"creditcard.fill")

            }.isDetailLink(false)
                        .padding(.top, 20)
                    
                if IsloggedIn{
                Button("Logout", action: {IsloggedIn.toggle()
                    Data.initdata.UserInformation=UserModels(ID: 0, UserName: "", FirstName: "", LastName: "", DateOfBirth: "", Password: "", Email: "", Admin: 0)
                    data.UserInformation=UserModels(ID: 0, UserName: "", FirstName: "", LastName: "", DateOfBirth: "", Password: "", Email: "", Admin: 0)
                }).padding(.top, 20)}
                    
                    Spacer()
                }
                
            }else{
                        NavigationLink {
                            LoginSwiftUIView(data: data)
                        } label: {
                            Label("Login", systemImage: "person.circle.fill")
                        }.isDetailLink(false)
                        
                Spacer()

                    }
           
            }
            .padding()
                .frame(maxWidth: .infinity,maxHeight:  .infinity, alignment: .trailing)
                .background(Color(red: 38/255, green:38/255, blue: 38/255))

                .onAppear{
                    IsloggedIn=(Data.initdata.UserInformation.ID != 0)
                }
            
        }

        
        
    
}

struct AccountTab_Previews: PreviewProvider {
    static var previews: some View {
        AccountTab(data:Data())
    }
}
