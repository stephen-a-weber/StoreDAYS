//
//  FeedbackSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/6/22.
//

import SwiftUI

struct FeedbackSwiftUIView: View {
    @State var animFlag3 = true
    @State var myColor = "myBlue"
    @State var messajeValidate = ""
    @State private var profileText = "Enter your feedback:"
    var body: some View {
        VStack {
            
            Text(messajeValidate)
                .foregroundColor(Color(myColor))
                .frame(width: 300, height: 20, alignment: .center)
            
            TextEditor(text: $profileText)
                .foregroundColor(.black).frame(width: 400, height: 100, alignment: .center)
                .cornerRadius(3.0)
                .colorMultiply(.white)
            Spacer()
            
            Button(action: {
                messajeValidate = "Thanks for you feedbak"
                animFlag3 = true
            }) {
                Text("SEND")
                    .fontWeight(.bold)
                    .foregroundColor(Color(myColor))
                    .frame( maxWidth: .infinity,  alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                        lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                
            }
            
        }.frame(width: 250, height: 250 )
    }
}

struct FeedbackSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackSwiftUIView()
    }
}
