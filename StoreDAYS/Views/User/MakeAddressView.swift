//
//  MakeAddressView.swift
//  StoreDAYS
//
//  Created by admin on 4/8/22.
//

import SwiftUI


struct MakeAddressView: View {
    @ObservedObject var data: Data
    @State var User_ID = 0
    @State var ID=0
    @State var Street=""
    @State var City=""
    @State var State=""
    @State var Zip=""
    @State var myColor = "myBlue"
    @State var flag=false
    @State var dataValidate = true
    @State var EditFlag = false
    @State var messageValidate = "Please enter your shipping address"
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView{
            VStack{
                // Validate Data
                                 if dataValidate == false {
                                     Text(messageValidate)
                                         .foregroundColor(Color(.red))
                                         .frame(width: 300, height: 20, alignment: .center)
                                 }
                //Make City:
                Group{
                Text("Street").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   TextField("", text: $Street)
                                   if  Street.isEmpty {
                                       Text("Write your Street").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                                   
                               }
                               Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)}
            
            //Make City:
                Group{
            Text("City").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   TextField("", text: $City)
                                   if  City.isEmpty {
                                       Text("City").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                                   
                               }
                               Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)}
            //Make State:
                Group{
            Text("State").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   TextField("", text: $State)

                                   if  State.isEmpty {
                                       Text("Write your State").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                                   
                               }
                               Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)}
            //Make Zip:
                Group{
            Text("Zip").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   TextField("", text: $Zip)

                                   if   Zip.isEmpty {
                                       Text("Write your Zip").font(.caption)
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
        if(Street==""||City==""||State==""||Zip==""){
            return false
        }
        let Address = AddressModels(ID: ID, Street: Street, City: City, User_ID: User_ID, State: State, Zip: Zip)
        if !EditFlag{
            POSTNewAddress(Model: Address)}
        else {
            POSTUpdateAddress(Model: Address)
            presentationMode.wrappedValue.dismiss()
        }
        return true;
    }
}


struct MakeAddressView_Previews: PreviewProvider {
    static var previews: some View {
        MakeAddressView(data:Data())
    }
}
