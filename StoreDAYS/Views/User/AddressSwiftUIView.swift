//
//  AdressSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/21/22.
//

import SwiftUI

struct AddressSwiftUIView: View {
    @EnvironmentObject var data:Data
    
      
        @State var firstName = ""
        @State var stateC = ""
        @State var email = ""
        @State var adress = ""
        @State var zipCode = ""
        @State var myColor = "myBlue"
        @State var dataValidate = true
        @State var animFlagLogin = false
        @State var messageValidateData = "Please enter your data"
        @State var manageCreateAccount = ManageCreateAccount()
        
        var body: some View{
            ScrollView {
                VStack (alignment:.leading){

                    if dataValidate == false {
                        Text(messageValidateData)
                            .foregroundColor(Color(.red))
                            .frame(width: 300, height: 20, alignment: .center)
                    }
                    Group{
                        Image("address").resizable().frame(width: 25, height: 25, alignment: .leading)
                    Text("Please Enter Your data").foregroundColor(Color(myColor)).bold().font(.system(size: 25))
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    }
                    Group{
                
                      
                        // MARK: First Name
                        Text("Name").foregroundColor(Color(myColor))
                        ZStack(alignment:.leading){
                            if  firstName.isEmpty {
                                Text("Robison").font(.caption)
                                    .foregroundColor(.gray)
                            }
                            TextField("", text: $firstName)
                        }
                        Divider().frame(height: 1).background(Color(myColor))
                            .padding(.bottom)
                       
                        // MARK: Email
                        Text("Email").foregroundColor(Color(myColor))
                        ZStack(alignment:.leading){
                            if  email.isEmpty {
                                Text("example@revature.net").font(.caption)
                                    .foregroundColor(.gray)
                            }
                            TextField("", text: $email)
                        }
                        Divider().frame(height: 1).background(Color(myColor))
                            .padding(.bottom)
                    
                    
                    
                    // MARK: Address
                    Text("Address").foregroundColor(Color(myColor))
                    ZStack(alignment:.leading){
                        if  adress.isEmpty {
                            Text("Write your address").font(.caption)
                                .foregroundColor(.gray)
                        }
                        TextField("", text: $adress)
                        
                        
                    }
                    Divider().frame(height: 1).background(Color(myColor))
                        .padding(.bottom)
                    
                }
                    Group {
                    // MARK: Last Name
                    Text("State").foregroundColor(Color(myColor))
                    ZStack(alignment:.leading){
                        if  stateC.isEmpty {
                            Text("IN").font(.caption)
                                .foregroundColor(.gray)
                        }
                        TextField("", text: $stateC)
                    }
                    Divider().frame(height: 1).background(Color(myColor))
                        .padding(.bottom)
                      
                    
                    
                    Text("Zip Code").foregroundColor(Color(myColor))
                    ZStack(alignment:.leading){
                        if  zipCode.isEmpty {
                            Text("Enter Zip Code").font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        TextField("", text: $zipCode)
                    }
                    Divider().frame(height: 1).background(Color(myColor))
                        .padding(.bottom)
                    }
                    // MARK: BUTTONS
                    Button(action: {
                        animFlagLogin = initSession()
                    }) {
                        Text("CONTINUE")
                            .fontWeight(.bold)
                            .foregroundColor(Color(myColor))
                            .frame( maxWidth: .infinity,  alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                                lineWidth: 3.0).shadow(color: .blue, radius: 6.0))

                            .sheet(isPresented: $animFlagLogin, content: {
                                InvoiceSwiftUIView()
                                    .environmentObject(CartManager())
                            })
                    }
                    .padding(.bottom, 25.0)
                    
                }.padding(.horizontal, 77.0)
            } // End Scrol
            .padding(.top, 10.0)
        }
        
        //MARK: initSession
        func initSession() -> Bool {
            // Validate enter full data
            if (firstName == "" || stateC == "" || email == "" || adress == "" || zipCode == ""){
                messageValidateData = "Please enter your data"
                dataValidate = false
                return false
            }else{
               
                print(" Data save ")
                data.customer = firstName
                data.address = "\(adress) - \(stateC) \(zipCode)"
                dataValidate = true
                return true
            }
        } // End initSession
        
       
      
  
    struct CreateSessionView:View{
        @EnvironmentObject var data:Data
        var body: some View{
            Text("Im Create account View")
        }
    }
    
    
    struct CreateAccountView:View{
        @EnvironmentObject var data:Data
        
        var body: some View{
            VStack{
                //MARK: BUTTON
                HStack {
                    
                    Spacer()
                    
                }
                .padding(0.0)
                Spacer(minLength: 42)
                
               
            }
        }
    }
//    var body: some View {
//        ZStack {
//            Spacer()
//            Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0)
//            VStack{
//
//                CreateAccountView()
//            }
//        }
//    }
}

struct AddressSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddressSwiftUIView()
            .environmentObject(Data())
    }
}
