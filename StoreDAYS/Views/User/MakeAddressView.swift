//
//  MakeAddressView.swift
//  StoreDAYS
//
//  Created by admin on 4/8/22.
//

import SwiftUI


struct MakeAddressView: View {

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
    @State var UseFlag=false
    @State var messageValidate = "Please enter your shipping address"
 

    var body: some View {
        
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
                   
                } label: {
                    Text("Continue")
                        .fontWeight(.bold)
                        .foregroundColor(Color(myColor))
                        .frame( maxWidth: .infinity,  alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                            lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                                                
                                                     .sheet(isPresented: $flag, content: {
                                                        
                                                     })
                }
                

        }
        .navigationTitle("Mailing Address")
    }

        
}
  


struct MakeAddressView_Previews: PreviewProvider {
    static var previews: some View {
        MakeAddressView()
    }
}
