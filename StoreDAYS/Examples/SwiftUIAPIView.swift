//
//  SwiftUIAPIView.swift
//  StoreDAYS
//
//  Created by admin on 4/1/22.
//

import SwiftUI
struct SwiftUIAPIView: View {
    @ObservedObject var data:Data
    var body: some View {
        NavigationView{
            List{
                ForEach(data.AvaiableItems){
                    AvailbleItem in
                    HStack{
                
                        AsyncImage(url: URL(string: AvailbleItem.Item.Img)) { image in
                                                    image.resizable()
                                                } placeholder: {
                                                    Color.red
                                                }
                                                .frame(width: 128, height: 128)
                                                .clipShape(RoundedRectangle(cornerRadius: 25))

                        Text(AvailbleItem.Item.Name)
                            .bold()
                        Text(String(AvailbleItem.Item.Cost))
                        Text(String(AvailbleItem.Item.Catagory_ID))
                        NavigationLink("", destination:DetailView(ItemedContainer: TheItemContainer(Item: AvailbleItem.Item), data:data, isPurchased: false))



                    }
                    .padding(3)
                }
            }
            .navigationTitle("Pets")
            .onAppear{
                data.loadDataBaseIntoItems()            }
        }
        
    }
}

struct SwiftUIAPIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAPIView(data:Data())
    }
}
