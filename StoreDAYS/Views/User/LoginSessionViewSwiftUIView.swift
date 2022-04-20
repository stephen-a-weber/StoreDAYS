//
//  LoginSessionViewSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/7/22.
//

import SwiftUI

struct LoginSessionViewSwiftUIView: View {
    @State var CheckingoutLoggingIn = false
    @Environment(\.presentationMode) var presentationMode

        @ObservedObject var data: Data
        @State var email = ""
        @State var password = ""
        @State var appGetUserFromAWS = ManageUserFromAWS()
        @State var myColor = "myBlue"
        @State var animFlagLogin = false
        @State var animFlag = false
        @State var animFlag2 = false
        @State var dataValidate = true
        @State var keyChainManage = KeyChainManage()
        @State var queue  = OperationQueue()
        @State var messajeValidate = "Please enter your email and password"
        
        var body: some View{
            ScrollView {
                VStack (alignment:.leading){
                    // Validate Data
                    if dataValidate == false {
                        Text(messajeValidate)
                            .foregroundColor(Color(.red))
                            .frame(width: 300, height: 20, alignment: .center)
                    }
                    // MARK: EMAIL
                    Text("Email").foregroundColor(Color(myColor))
                    ZStack(alignment:.leading){
                        if  email.isEmpty {
                            Text("example: DavidG@gmail.com").font(.caption)
                                .foregroundColor(.gray)
                        }
                        TextField("", text: $email)
                    }
                    Divider().frame(height: 1).background(Color(myColor))
                        .padding(.bottom)
                    // MARK: PASSWORD
                    Text("Password").foregroundColor(Color(myColor))
                    ZStack(alignment:.leading){
                        if  password.isEmpty {
                            Text("Write your password").font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $password)
                    }
                    Divider().frame(height: 1).background(Color(myColor))
                        .padding(.bottom)
                    // TODO: add option
                    //                    Text("Forgot your password?").font(.footnote)
                    //                        .frame(width: 300, alignment: .trailing).foregroundColor(Color(myColor))
                    //                        .padding(.bottom, 40.0)
                    // MARK: BUTTONS
                        .padding(.bottom, 25.0)
                    
                    
                   if(CheckingoutLoggingIn){
                    

                       NavigationLink(isActive: $animFlag2) {CardBook(CartOrAccount: true, data: data).environmentObject(CartManager()) }label:{
                               Button{animFlag2=initSession()}label:{Text("CONTINUE")
                                   .fontWeight(.bold)
                                   .foregroundColor(Color(myColor))
                                   .frame( maxWidth: .infinity,  alignment: .center)
                                   .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                                   .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                                       lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                               }
                           }.isDetailLink(false)
                           
                           
                               
                       
                       .padding(.bottom, 25.0)
                       Button(action: {
                        animFlag = continueGuest()
                    }) {
                        Text("CONTINUE AS GUEST")
                            .fontWeight(.bold)
                            .foregroundColor(Color(myColor))
                            .frame( maxWidth: .infinity,  alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                                lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                        
                            .sheet(isPresented: $animFlag, content: {
        
                                //  PayTabView()
                                GuestBasicInfoForm(data:data)
                                //InvoiceSwiftUIView(data: data)
                                    .environmentObject(CartManager())
//                                TabDocumentsSwiftUIView(data: data)
                            })
                    }
                       .padding(.bottom, 20.0)}
                    else{
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
                               
                                   
                           }
                           .padding(.bottom, 25.0)
                       }
                    Button(action: {
	
                        animFlag2 = continueVideo()
                    }) {
                      
                        ZStack{
                        Text("")
                        
                            .fontWeight(.bold)
                            .foregroundColor(Color(myColor))
                            .frame( maxWidth: .infinity,  alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                                lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                        
                             .sheet(isPresented: $animFlag2, content: {
                                 TabSwiftMoreUIView(data: data )
                             })
                            
                            Image(systemName: "questionmark.folder")
                                .font(.title2)
                            
                        }
                    }
                    
                    
               
                    
                    
                }.padding(.horizontal, 77.0).frame(width: nil)
            } // Final Scroll view
            .padding(.top, 10.0)
            
        }
        
        
        
        //MARK: initSession
        func initSession() -> Bool {
            var existUser = false
            if (email == "" || password == ""){
                messajeValidate = "Please enter your email and password"
                dataValidate = false
                return false
            }else{
                // If credentials = OK
                dataValidate = true
                queue.maxConcurrentOperationCount = 1
                
                POSTSignIn(Email: email, Password: password, SignupHandler: {
                    GivenUser, error in
                    DispatchQueue.main.sync {
                        Data.initdata.UserInformation=GivenUser!

                        data.UserInformation=GivenUser!
                    }
                })
                existUser=(data.UserInformation.ID != 0)
                if existUser && !CheckingoutLoggingIn{
                    presentationMode.wrappedValue.dismiss()}
                return existUser
            }
        }
        
        func continueGuest() -> Bool {
            return true
        }
        func continueVideo() -> Bool {
            return true
        }

}

struct LoginSessionViewSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSessionViewSwiftUIView(data: Data())
    }
}
