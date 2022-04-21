//
//  InvoiceList.swift
//  StoreDAYS
//
//  Created by admin on 4/11/22.
//

import SwiftUI

struct InvoiceList: View {
    @ObservedObject var data: Data

    @StateObject var Model=viewInvoiceListModel()

    var body: some View {
            List{

                ForEach(Model.Containers, id:\.self){
                    Invoice in
                    
                    NavigationLink{
                        DetailInvoiceView(selfInvoice: Invoice.SelfInvoice)}
                label:{
                        HStack{
                            
                        Text("Invoice Number:#\(Invoice.SelfInvoice.ID)")
                        Text("Cost:$\(Invoice.SelfInvoice.Cost)")
                        }
                    }
                    
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            print("Refund")
                        } label: {
                            Text("Refund")
                        }
                        .tint(.blue)
                    }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                print("Complete")
                            } label: {
                                Text("Complete")
                            }
                            .tint(.green)
                        }
                    }
            }            .onAppear{Model.loadInvoices(User_ID: Data.initdata.UserInformation.ID)}
                .navigationTitle("Invoice Orders")
            }
        
        
        }
    

struct InvoiceList_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceList(data: Data())
    }
}
