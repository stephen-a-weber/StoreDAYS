//
//  InvoiceList.swift
//  StoreDAYS
//
//  Created by admin on 4/11/22.
//

import SwiftUI
class viewInvoiceListModel:ObservableObject{
    @Published var InvoicesModel :[InvoiceModels]=[]
    @Published var Containers:[Invoices]=[]
    
    func loadOrdersIntoInvoice(){
        for invoice in InvoicesModel{
            var InvoiceOrders=[Orders]()
            GETOrder(Invoice_ID: invoice.ID) { DataOrders, error in
                for Order in DataOrders!{
                    GETItems(Order_ID: Order.ID) { Items, error in
                        InvoiceOrders.append(Orders(SelfOrder: Order, Items: Items!))
                        
                    }
                }
                
                
            }
            DispatchQueue.main.async {
                self.Containers.append(Invoices(SelfInvoice: invoice, Order:InvoiceOrders))
            }
        }
    }
    func loadInvoices(User_ID:Int){
        GETInvoice(User_ID: User_ID, InvoiceCompletionHandler: { Invoices, error in
            DispatchQueue.main.async {
                self.InvoicesModel=Invoices!
                self.loadOrdersIntoInvoice()
            }
        })
    }
    func load(User_ID:Int){
        loadInvoices(User_ID: User_ID)
        loadOrdersIntoInvoice()
    }
}
struct InvoiceList: View {
    
    @StateObject var Model=viewInvoiceListModel()

    var body: some View {
        NavigationView{
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
                }            .onAppear{Model.loadInvoices(User_ID: 2)}
                .navigationTitle("Invoice Orders")
            }
        }
        
        }
    

struct InvoiceList_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceList()
    }
}
