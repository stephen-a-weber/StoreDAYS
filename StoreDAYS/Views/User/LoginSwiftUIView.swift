//
//  LoginSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 3/30/22.
//

import SwiftUI

struct LoginSwiftUIView: View {
    
    struct LoginSessionView:View{
        
        @State var email = ""
        @State var password = ""
        @State var appGetUserFromAWS = GetUserFromAWS()
        @State var myColor = "myBlue"
        var body: some View{
            ScrollView {
                VStack (alignment:.leading){
                    // MARK: EMAIL
                    Text("Email").foregroundColor(Color(myColor))
                    ZStack(alignment:.leading){
                        if  email.isEmpty {
                            Text("example@gmail.com").font(.caption)
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
                    
                    Text("Forgot your password?").font(.footnote)
                        .frame(width: 300, alignment: .trailing).foregroundColor(Color(myColor))
                        .padding(.bottom, 40.0)
                    // MARK: BUTTONS
                    Button(action: initSession, label: {
                        Text("CONTINUE")
                            .fontWeight(.bold)
                            .foregroundColor(Color(myColor))
                            .frame( maxWidth: .infinity,  alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                                lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                    })
                        .padding(.bottom, 25.0)
                    
                    Button(action: initSession, label: {
                        Text("CONTINUE AS GUEST")
                            .fontWeight(.bold)
                            .foregroundColor(Color(myColor))
                            .frame( maxWidth: .infinity,  alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                                lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                    })
                    
                    
                }.padding(.horizontal, 77.0).frame(width: nil)
            }
            .padding(.top, 50.0)
        }
        
        //MARK: initSession
        func initSession(){
            print("init session")
            //   readUser()
            appGetUserFromAWS.read()
        }
    }
    
    
    struct CreateSessionView:View{
        var body: some View{
            Text("Im Create account View")
        }
    }
    
    
    struct LoginAndCreateView:View{
        @State var typeLoginSession = true
        var body: some View{
            VStack{
                //MARK: BUTTON
                HStack {
                    Spacer()
                    Button("LOGIN"){
                        typeLoginSession = true
                        print("login")
                    }.foregroundColor(typeLoginSession ? .blue : .gray)
                    
                    Spacer()
                    
                    //   NavigationLink("",  destination: CreateAccountSwiftUIView())
                    
                    
                    //NavigationLink(LocalizedStringKey) {CreateAccountSwiftUIView()   }
                    Button("CREATE ACCOUNT"){
                        
                        typeLoginSession = false
                        //  CreateAccountSwiftUIView()
                        print("CREATE ACCOUNT")
                    }.foregroundColor(typeLoginSession ? .gray : .blue)
                    
                    
                    Spacer()
                    
                }
                .padding(0.0)
                Spacer(minLength: 42)
                
                if typeLoginSession == true {
                    LoginSessionView()
                }else{
                    CreateAccountSwiftUIView()
                    //CreateSessionView()
                }
            }
        }
    }
    var body: some View {
        ZStack {
            Spacer()
            Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 1.0)
            VStack{
                Image("logo1").resizable().aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                    .frame(width: 250, height: 89, alignment: .center)
                LoginAndCreateView()
            }
        }
    }
}

struct LoginSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSwiftUIView()
    }
}


