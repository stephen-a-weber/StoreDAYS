//
//  CreateAccountSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 3/31/22.
//

import SwiftUI

struct CreateAccountSwiftUIView: View {
    struct LoginSessionView:View{
        @State var firstName = ""
        @State var lastName = ""
        @State var email = ""
        @State var password = ""
        @State var passwordConfirm = ""
        @State var myColor = "myBlue"
        @State var animFlagLogin = false
        
        
        var body: some View{
            ScrollView {
                VStack (alignment:.leading){
                    Group{
                        // MARK: Last Name
                        Text("First Name").foregroundColor(Color(myColor))
                        ZStack(alignment:.leading){
                            if  firstName.isEmpty {
                                Text("Robison").font(.caption)
                                    .foregroundColor(.gray)
                            }
                            TextField("", text: $firstName)
                        }
                        Divider().frame(height: 1).background(Color(myColor))
                            .padding(.bottom)
                    // MARK: Last Name
                    Text("Last Name").foregroundColor(Color(myColor))
                    ZStack(alignment:.leading){
                        if  lastName.isEmpty {
                            Text("Cruzo").font(.caption)
                                .foregroundColor(.gray)
                        }
                        TextField("", text: $lastName)
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
                    }
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
                    
                    
                    // MARK: BUTTONS
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
                        
//                            .fullScreenCover(isPresented: $animFlag, content: {
//                                PaySwiftUIView()
//                              .edgesIgnoringSafeArea(.all)
//                              .animation(.easeInOut)
//                              .transition(.move(edge: .bottom))
//                        })
                        
                        
                            .sheet(isPresented: $animFlagLogin, content: {
                                PaySwiftUIView()
                            })
                    }
                        .padding(.bottom, 25.0)
                    
                }.padding(.horizontal, 77.0)
            }
            .padding(.top, 50.0)
        }
        
        //MARK: initSession
        
         //MARK: initSession
         func initSession() -> Bool {
             print(" Into ")
             return true
         }
    }
    
    
    
    struct CreateSessionView:View{
        var body: some View{
            Text("Im Create account View")
        }
    }
    
    
    struct CreateAccountView:View{
        @State var typeLoginSession = true
        var body: some View{
            VStack{
                //MARK: BUTTON
                HStack {
                    
                    Spacer()
                    
                }
                .padding(0.0)
                Spacer(minLength: 42)
                
                if typeLoginSession == true {
                    LoginSessionView()
                }else{
                    CreateSessionView()
                }
            }
        }
    }
    var body: some View {
        ZStack {
            Spacer()
            Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0)
            VStack{
                
                CreateAccountView()
            }
        }
    }
}

struct CreateAccountSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountSwiftUIView()
    }
}
