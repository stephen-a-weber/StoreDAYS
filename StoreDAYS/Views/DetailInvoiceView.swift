//
//  DetailInvoiceView.swift
//  StoreDAYS
//
//  Created by admin on 4/12/22.
//

import SwiftUI
class InvoiceViewModel: ObservableObject{
    @Published var OrderList:[OrdersModels]=[]
    @Published var Address:AddressModels=AddressModels(ID: 0, Street: "", City: "", User_ID: 0, State: "", Zip: "")
    @Published var Shipping=ShippingModels(ID: 0, ShippingType: "", Cost: "", ETA: "", User_ID: 0, Status: "", Address_ID:0)
    @Published var Payment = PaymentsModels(ID: 0, CardNumber: "", CVC: 0, Expiration: "", Name: "", User_ID: 0, Address_ID: 0)
    func load(Invoice_ID:Int){
        GETOrder(Invoice_ID: Invoice_ID, OrderCompletionHandler:  { Orders, error in
            DispatchQueue.main.async {

                self.OrderList=Orders!
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
               HStack{ Text("With Card\(TheInvoice.Payment.Name)")
                Text("To:"+TheInvoice.Address.Street+", "+TheInvoice.Address.City+", "+TheInvoice.Address.State+TheInvoice.Address.Zip)}
                ForEach(TheInvoice.OrderList, id:\.self){
                    EachOrder in
                    HStack{
                        Text("Status:\(EachOrder.Description)")
                        
                    }
                }
            }
            .onAppear{
                TheInvoice.load(Invoice_ID: selfInvoice.ID)
                TheInvoice.loadPayment(Payment_ID: selfInvoice.PaymentMethods_ID)
                TheInvoice.loadShipping(Shipping_ID:selfInvoice.Shipping_ID )
            }
            .navigationTitle("Invoice:\(selfInvoice.ID)")

            }
        

        }

    }


struct DetailInvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        DetailInvoiceView(selfInvoice: InvoiceModels(ID: 2, Cost: "", User_ID: 2, Shipping_ID: 1, PaymentMethods_ID: 1))
    }
}
