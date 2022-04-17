//
//  DetailInvoiceView.swift
//  StoreDAYS
//
//  Created by admin on 4/12/22.
//

import SwiftUI
class InvoiceViewModel: ObservableObject{
    @Published var OrderList:[OrdersModels]=[]
    @Published var OrdersWithItems:[Orders]=[]
    @Published var Address:AddressModels=AddressModels(ID: 0, Street: "", City: "", User_ID: 0, State: "", Zip: "")
    @Published var Shipping=ShippingModels(ID: 0, ShippingType: "", Cost: 0.0, ETA: "", User_ID: 0, Status: "", Address_ID:0)
    @Published var Payment = PaymentsModels(ID: 0, CardNumber: "", CVC: "", Expiration: "", Name: "", User_ID: 0, Address_ID: 0)
    func loadItems(){
        
        print(OrderList.capacity)
        for GivenOrder in OrderList{
            print(GivenOrder.ID)
            GETItems(Order_ID: GivenOrder.ID, completion: {
                GivenItem, error in
                DispatchQueue.main.sync {
                    self.OrdersWithItems.append(Orders(SelfOrder: GivenOrder, Items: GivenItem!))
                }
            })
            
        }
    }
    func load(Invoice_ID:Int){
        GETOrder(Invoice_ID: Invoice_ID, OrderCompletionHandler:  { Orders, error in
            DispatchQueue.main.sync {

                self.OrderList=Orders!
                self.loadItems()

            }
        })
    }
    func loadAddress(){
        GETAddress(ID: Shipping.Address_ID, SingleCompletionAddressHandler: { Address, eroor in
            DispatchQueue.main.async{self.Address=Address!}
        })
    }
    func loadShipping(Shipping_ID:Int){
        GETShipping(ID: Shipping_ID, ShippingComplete: {
            DataShipping, Error in
            DispatchQueue.main.sync {
                self.Shipping=DataShipping!
                self.loadAddress()
            }
        })

    }
    
    func loadPayment(Payment_ID:Int){
        GETPaymentMethods(ID: Payment_ID, PaymentCompletionHandler:  { Payment, eroor in
            DispatchQueue.main.async{
                self.Payment=Payment!
                
            }
        }
        )
    }
}
struct DetailInvoiceView: View {
    @State var selfInvoice:InvoiceModels
    @StateObject var TheInvoice=InvoiceViewModel()
    var body: some View {
        NavigationView{
        
                  
            List{
               HStack{
                   Text("With Card\(TheInvoice.Payment.Name)")
               
                Text("To:\(TheInvoice.Address.Street), \(TheInvoice.Address.City), \(TheInvoice.Address.State) \(TheInvoice.Address.Zip)")}
                ForEach(TheInvoice.OrdersWithItems, id:\.self){
                    EachOrder in
                    VStack{
                        HStack{
                        
                            Text("Status:\(EachOrder.SelfOrder.Description)")
                            Text("ETA: \(TheInvoice.Shipping.ETA)")
                        }
                        
    
                        HStack{ AsyncImage(url: URL(string: EachOrder.Items.Img)) { image in
                                                                               image.resizable()
                                                                           } placeholder: {
                                                                               Color.red
                                                                           }
                                                                           .frame(width: 128, height: 128)
                                                                           .clipShape(RoundedRectangle(cornerRadius: 25))

                            Text(EachOrder.Items.Name)
                                                       .bold()
                            Text(String(EachOrder.Items.Cost))
                            
                            
                        }
                            
                        }
                    }
                }
            }
            .onAppear{
                TheInvoice.load(Invoice_ID: selfInvoice.ID)
                TheInvoice.loadPayment(Payment_ID: selfInvoice.PaymentMethods_ID)
                TheInvoice.loadShipping(Shipping_ID:selfInvoice.Shipping_ID)
            }
            .navigationTitle("Invoice:\(selfInvoice.ID)")

            }
        

        }




struct DetailInvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInvoiceView(selfInvoice: InvoiceModels(ID: 10, Cost: 0.0, User_ID: 2, Shipping_ID: 1, PaymentMethods_ID: 1))
    }
}
