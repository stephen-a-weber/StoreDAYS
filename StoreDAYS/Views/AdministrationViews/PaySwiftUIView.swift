//
//  PaySwiftUIView.swift
//  StoreDAYS
//

//

      //
      //  PaySwiftUIView.swift
      //  StoreDAYS
      //

      //

      import SwiftUI

      struct PaySwiftUIView: View {
            @State var user: String = ""


          var body: some View {
                NavigationView {

              VStack{
      //            CardSetupButton(action: {})
      //                .frame(minWidth: 200, maxWidth: 400)
      //                .frame(height: 45)
      //                .frame(maxWidth: .infinity)
      //                       .padding()
                    PaymentButton(action: {})
                        .frame(minWidth: 400, maxWidth: 400)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                              .padding()
      //              NavigationLink(isActive: true) { T2View()}
                    NavigationLink {
                          PayTabView()
                    }
                label: {
                        Text("For customer satisfaction!")
                            .foregroundColor(Color.black)
                    }
      //              Spacer()
      //              Text(user)
         }
                }
          }
      }

      struct PaySwiftUIView_Previews: PreviewProvider {
          static var previews: some View {
              PaySwiftUIView(user: "ddt")
          }
      }

 
