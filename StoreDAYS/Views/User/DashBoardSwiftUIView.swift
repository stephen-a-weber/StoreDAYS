//
//  DashBoardSwiftUIView.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/7/22.
//

import SwiftUI

struct DashBoardSwiftUIView: View {
    @State var message = ""
    @State var model = WebViewModel()
    @ObservedObject var data: Data
    @State var myColor = "myBlue"
    @State var messajeValidate = "DASHBOARD"
    var body: some View {
        VStack {
            
         
            Text(messajeValidate)
                .foregroundColor(Color(myColor))
                .frame(width: 300, height: 50, alignment: .center)
            Spacer()
            
            Image("dash1")
                .resizable()
                .scaledToFit()
            Image("dash2")
                .resizable()
                .scaledToFit().frame(width: 400, height: 190, alignment: .center)
         //   WebView(webView: model.webView).frame(width: 400, height: 650, alignment: .center)
            Spacer()
            
            
        }
    }
}

func initData(){
    var db: DBHelper = DBHelper()
    var total =  db.getTotalItems()
   // message = "Your Total is : \(total)"
}

struct DashBoardSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardSwiftUIView(data: Data())
    }
}
