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
                          T2View()
                            .frame(height: 350)
                    }
                label: {
                        Text("Show me current spot of my pets?")
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

      //struct PaySwiftUIView: View {
      //    @State var user: String = ""
      //    var body: some View {
      //
      //        VStack {
      //            Text( " Pay")
      //            Text(user)
      //        }
      //
      //    }
      //}
      //
      //struct PaySwiftUIView_Previews: PreviewProvider {
      //    static var previews: some View {
      //        PaySwiftUIView(user: "ddt")
      //    }
      //}

