//
//  MakeNewCardPayment.swift
//  StoreDAYS
//
//  Created by admin on 4/10/22.
//

import SwiftUI

struct MakeNewCardPayment: View {
    @ObservedObject var data: Data
    @State var CardNumber=""
    @State var CVC=""
    @State var Expiration=""
    @State var Address_ID=""
    @State var Name=""
    @State var myColor = "myBlue"
    @State var flag=false
    @State var dataValidate = true
    @State var messageValidate = "Please enter your payment information"
    var body: some View {
        ScrollView{
            VStack{
                // Validate Data
                                 if dataValidate == false {
                                     Text(messageValidate)
                                         .foregroundColor(Color(.red))
                                         .frame(width: 300, height: 20, alignment: .center)
                                 }
                //Make CardNumber:
                Group{
                Text("CardNumber").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   TextField("", text: $CardNumber)
                                   if  CardNumber.isEmpty {
                                       Text("Write your CardNumber").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                                   
                               }
                               Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)}
            
            //Make CVC:
                Group{
            Text("Card's CVC").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   TextField("", text: $CVC)
                                   if  CVC.isEmpty {
                                       Text("CVC").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                                   
                               }
                               Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)}
            //Make Expiration:
                Group{
            Text("Expiration").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   TextField("", text: $Expiration)

                                   if  Expiration.isEmpty {
                                       Text("Write your Expiration").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                                   
                               }
                               Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)}
            //Make:Name
                Group{
            Text("Name").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   TextField("", text: $Name)

                                   if   Name.isEmpty {
                                       Text("Write your Card Name").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                               }
                    Divider().frame(height: 1).background(Color(myColor))
         .padding(.bottom)
                }
                
                
                Button {
                    dataValidate=continueSession()
                } label: {
                    Text("Continue")
                        .fontWeight(.bold)
                        .foregroundColor(Color(myColor))
                        .frame( maxWidth: .infinity,  alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                            lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                                                
                                                     .sheet(isPresented: $flag, content: {
                                                         TabSwiftMoreUIView(data: data )
                                                     })
                }

        }.padding(.horizontal,77.0)
    }.padding(.top, 10.0)
        
    }
    func continueSession()->Bool{
        if(CardNumber==""||CVC==""||Expiration==""||Name==""){
            return false
        }
        let Payment = PaymentsModels(ID: "", CardNumber: CardNumber, CVC: CVC, Expiration: Expiration, Name: Name, User_ID: "2", Address_ID: "2")
        POSTNewPaymentMethods(Model: Payment)
        return true;
    }
}

struct MakeNewCardPayment_Previews: PreviewProvider {
    static var previews: some View {
        MakeNewCardPayment(data:Data())
    }
}
