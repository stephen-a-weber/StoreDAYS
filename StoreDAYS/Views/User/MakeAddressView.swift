//
//  MakeAddressView.swift
//  StoreDAYS
//
//  Created by admin on 4/8/22.
//

import SwiftUI


struct MakeAddressView: View {
    @State var Street=""
    @State var City=""
    @State var State=""
    @State var Zip=""
    @State var myColor = "myBlue"
    @State var flag=false
    @State var dataValidate = false
    @State var messageValidate = "Please enter your shipping address"
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
                                   if  City.isEmpty {
                                       Text("City").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                                   
                                   SecureField("", text: $City)
                               }
                               Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)}
            //Make State:
                Group{
            Text("State").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   if  State.isEmpty {
                                       Text("Write your State").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                                   
                                   SecureField("", text: $State)
                               }
                               Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)}
            //Make Zip:
                Group{
            Text("Zip").foregroundColor(Color(myColor))
                               ZStack(alignment:.leading){
                                   if   Zip.isEmpty {
                                       Text("Write your Zip").font(.caption)
                                           .foregroundColor(.gray)
                                   }
                               }
                    Divider().frame(height: 1).background(Color(myColor))
         .padding(.bottom)
                }
                
                
                Button {
                    flag=true
                } label: {
                    Text("Continue")
                }

        }.padding(.horizontal,77.0)
    }.padding(.top, 10.0)

        
    }
}

struct MakeAddressView_Previews: PreviewProvider {
    static var previews: some View {
        MakeAddressView()
    }
}
