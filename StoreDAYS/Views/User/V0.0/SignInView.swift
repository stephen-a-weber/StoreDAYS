//
//  SignInView.swift
//  StoreDAYS
//
//  Created by stephen weber on 3/30/22.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    var body: some View {
      
        NavigationView {
        Form {
            Section{
                VStack(alignment: .center, spacing: 30){
                    
                    
                    Spacer()
                    
                    Spacer()
                    
                TextField("  Email Address", text: $email)
                    .frame(width:350,height:60)
                    .border(Color.gray, width:4)
                    
                Button("Continue") {
                    print("sure go here") }
                .frame(width: 155.0, height: 60.0)
                .buttonStyle(.bordered)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                NavigationLink {      }
                    label: {Text("Don't have an Account?")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth:.infinity)
                    
                }
            
                    
                Button("Continue as Guest") {
                    print("sure go here") }
                .buttonStyle(.bordered)
                .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
               
                
                }
                NavigationLink {   }
                
                label : {
                    Text ("Create account")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                        
                        .frame(maxWidth:.infinity)
                        
                        
                    
              
                }
            
                
                Spacer()
                
                
            }
            
            
            
            
        }
        .navigationTitle("Sign In to Store Days")
        .navigationBarTitleDisplayMode(.inline)
            
        
        }
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
