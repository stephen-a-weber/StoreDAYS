//
//  GuestBasicInfoForm.swift
//  StoreDAYS
//
//  Created by admin on 4/15/22.
//

import SwiftUI

struct GuestBasicInfoForm: View {
    @ObservedObject var data:Data
    @State var myColor = "myBlue"
    @State var FirstName=""
    @State var LastName=""
    @State var Email=""
    @State var dataValidate = true
    @State var messageValidate = "Please enter your Basic Information for shipping"

    @State private var ShowingSheet=false
    var body: some View {
        VStack{
            if dataValidate == false {
                Text(messageValidate)
                    .foregroundColor(Color(.red))
                    .frame(width: 300, height: 20, alignment: .center)
            }
            //FirstName
            Group{
                Text("First Name").foregroundColor(Color(myColor))
                ZStack(alignment:.leading){
                    TextField("", text: $FirstName)
                    
                    if   FirstName.isEmpty {
                        Text("Write your FirstName").font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)
            }
            //LastName
            Group{
                Text("Last Name").foregroundColor(Color(myColor))
                ZStack(alignment:.leading){
                    TextField("", text: $LastName)
                    
                    if   LastName.isEmpty {
                        Text("Write your LastName").font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)
            }
            //Email
            Group{
                Text("Email").foregroundColor(Color(myColor))
                ZStack(alignment:.leading){
                    TextField("", text: $Email)
                    
                    if   Email.isEmpty {
                        Text("Write your Email").font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                Divider().frame(height: 1).background(Color(myColor))
                    .padding(.bottom)
            }
            Button {
                if(!(FirstName==""||LastName==""||Email=="")){
                Data.initdata.UserInformation=UserModels(ID: 0, UserName: "", FirstName: FirstName, LastName: LastName, DateOfBirth: "", Password: "123Password!", Email: Email, Admin: "")
                ShowingSheet.toggle()
                }else{
                    dataValidate=false
                }
                
            } label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundColor(Color(myColor))
                    .frame( maxWidth: .infinity,  alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                        lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                                            
                                                 
            }.fullScreenCover(isPresented: $ShowingSheet){MakeAddressView(data: data)}
            
        }        .padding(.horizontal,77.0)
            .padding(.top,10)
            .onAppear{
                print("firstname:\(Data.initdata.UserInformation.FirstName)")
                print("State:\(Data.initdata.AddressInformation.State)")
                print("items\(Data.initdata.ItemedCart.description)")
            }
    }
        
}

struct GuestBasicInfoForm_Previews: PreviewProvider {
    static var previews: some View {
        GuestBasicInfoForm(data:Data())
    }
}
