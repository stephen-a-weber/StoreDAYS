//
//  CreateAccountSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 3/31/22.
//
import SwiftUI

struct CreateAccountSwiftUIView: View {
    @EnvironmentObject var data:Data
    struct LoginSessionView:View{
        @EnvironmentObject var data:Data
        @State var firstName = ""
        @State var lastName = ""
        @State var email = ""
        @State var password = ""
        @State var passwordConfirm = ""
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
                        // MARK: First Name
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
                    
                    Text("Confirm Password").foregroundColor(Color(myColor))
                    ZStack(alignment:.leading){
                        if  passwordConfirm.isEmpty {
                            Text("Confirm your password").font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $passwordConfirm)
                    }
                    Divider().frame(height: 1).background(Color(myColor))
                        .padding(.bottom)
                    
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
            if (firstName == "" || lastName == "" || email == "" || password == "" || passwordConfirm == ""){
                messageValidateData = "Please enter your data"
                dataValidate = false
                return false
            }else{
                // Call Functions ManageCreateAccount // Controllers files
                print(!manageCreateAccount.validatePass(pass1: password, pass2: passwordConfirm))
                if  !manageCreateAccount.validatePass(pass1: password, pass2: passwordConfirm){
                    messageValidateData = "Pass does not match"
                    return false
                }
                print(" Data save ")
                // Save User KeyChain
                manageCreateAccount.saveUserKeyChain(email: email, password: password)
                //  Insert user sqLite
                manageCreateAccount.saveUserDB(userName: email, firstName: firstName, lastName: lastName, dateOfBirth: "01-01-1980", password: password, email: email)
                // Web Service AWS Insert user
                manageCreateAccount.insertUserAWSService(userName: email, firstName: firstName, lastName: lastName, email: email, password: password)
                dataValidate = true
                return true
            }
        } // End initSession
        
       
      
    }
    struct CreateSessionView:View{
        @EnvironmentObject var data:Data
        var body: some View{
            Text("Im Create account View")
        }
    }
    
    
    struct CreateAccountView:View{
        @EnvironmentObject var data:Data
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
            .environmentObject(Data())
    }
}
