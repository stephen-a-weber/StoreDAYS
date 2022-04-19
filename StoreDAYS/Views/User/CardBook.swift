//
//  CardBook.swift
//  StoreDAYS
//
//  Created by admin on 4/12/22.
//

import SwiftUI
class viewCardModel: ObservableObject{
    @Published var Cards:[PaymentsModels]=[]
    func loadCard(User_ID:Int){
        GETPaymentMethods(User_ID: User_ID) { Cards, error in
            DispatchQueue.main.sync{self.Cards=Cards!}
        }
    }
}
struct CardBook: View {
    @State var CartOrAccount=false
    @ObservedObject var data: Data
    @State var User_ID=Data.initdata.UserInformation.ID
    @StateObject var Model=viewCardModel()
    var body: some View {
        NavigationView{
                   List{
                       
                       ForEach(Model.Cards, id: \.self){
                           Card in
                           
                          
                           NavigationLink {
                              
                               OtherPay(degrees: 0, flipped: false, ID: Card.ID, User_ID: User_ID, UseEditFlag: false, cardNumber: Card.CardNumber, cardHolderName: Card.Name, expiration: Card.Expiration, cvv: String(Card.CVC))
                           } label: {
                               HStack{
                                   VStack{
                                       Text("Name: \(Card.Name)")
                                       HStack{
                                           Text("Expiration: \(Card.Expiration)")
                                       Text("CVC:\(Card.CVC)")
                                         }
                                       let last4=String(Card.CardNumber.prefix(4))
                                   Text("Card Number:**** **** **** \(last4)")
                                       
                                   }
                                   
                                  
                               }
                           }
                           .swipeActions(edge: .trailing, allowsFullSwipe: true, content: {
                               Button{
                                   
                                   DeleteCard(ID: Card.ID)
                                   Model.loadCard(User_ID: User_ID)
                               }label:{Label("Delete", systemImage: "trash")}
                               .tint(.red)

                           })
                                      
                                                 
                   }
                       .onDelete(perform: { index in
                       DeleteCard(ID: Model.Cards[index[index.startIndex]].ID)
                           Model.Cards.remove(atOffsets: index)
                           Model.loadCard(User_ID: User_ID)
                       })
                   }
                   .padding(.trailing)
                   
                   .onAppear{
                       Model.loadCard(User_ID: 2)
                   }
                   .navigationTitle("Card Book")
                   .toolbar {
                       ToolbarItem(placement: .navigationBarTrailing){
                           NavigationLink {
                               OtherPay(degrees: 0, flipped: false, ID: 0, User_ID: User_ID, UseEditFlag: false, cardNumber: "", cardHolderName: "", expiration: "", cvv: "")                           } label: {
                               Image(systemName: "plus")
                           }

                       }

                   }

               }
               
               
           }
    
}


struct CardBook_Previews: PreviewProvider {
    static var previews: some View {
        CardBook(data: Data())
    }
}
