//
//  CreateAccountView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var Fname = ""
    @State private var Lname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var password2 = ""
    var body: some View {
     
        
          NavigationView {
          Form {
              Section{
                  VStack(alignment: .center, spacing: 30){
                      
                      
                      Spacer()
                      
                      Spacer()
                      
                      TextField("  First Name", text: $Fname)
                          .frame(width:350,height:60)
                          .border(Color.gray, width:4)
                      
                      TextField("  Last Name", text: $Lname)
                          .frame(width:350,height:60)
                          .border(Color.gray, width:4)
                      
                      TextField("  Email", text: $email)
                          .frame(width:350,height:60)
                          .border(Color.gray, width:4)
                       
                      SecureField("  Password", text: $password)
                          .frame(width:350,height:60)
                          .border(Color.gray, width:4)
                       
                      SecureField("  Password", text: $password2)
                          .frame(width:350,height:60)
                          .border(Color.gray, width:4)
                       
                      Button("Continue") {
                          print("sure go here") }
                      .frame(width: 155.0, height: 60.0)
                      .buttonStyle(.bordered)
                      .background(.blue)
                      .foregroundColor(.white)
                      .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                      
                      
                  }
                  }
          }
          .navigationTitle("Create Account")
          .navigationBarTitleDisplayMode(.inline)
              
          
          }
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
