//
//  LoginSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 3/30/22.
//

import SwiftUI

struct LoginSwiftUIView: View {
    @ObservedObject var data: Data
    // LOGIN     CREATE ACCOUNT
    struct LoginAndCreateView:View{
        @State var typeLoginSession = true
        @ObservedObject var data: Data
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
                    
                    Button("CREATE ACCOUNT"){
                        typeLoginSession = false
                        print("CREATE ACCOUNT")
                    }.foregroundColor(typeLoginSession ? .gray : .blue)
                    
                    Spacer()
                    
                }
                .padding(0.0)
                Spacer(minLength: 42)
                
                
                if typeLoginSession == true {
                    LoginSessionViewSwiftUIView(data: Data())
                }else{
                    CreateAccountSwiftUIView(data: Data())
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
                
                
                LoginAndCreateView(data: Data())
            }
        }
    }
}

struct LoginSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSwiftUIView(data: Data())
    }
}
